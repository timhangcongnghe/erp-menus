module Erp::Menus
  class Menu < ApplicationRecord
		include Erp::CustomOrder
		
		mount_uploader :image_url_1, Erp::Menus::MenuImageUploader
		mount_uploader :image_url_2, Erp::Menus::MenuImageUploader
    validates :name, :menu_type, :presence => true
    belongs_to :creator, class_name: "Erp::User"
    belongs_to :parent, class_name: "Erp::Menus::Menu", optional: true
    has_many :children, class_name: "Erp::Menus::Menu", foreign_key: "parent_id"
    has_many :related_menus, foreign_key: "parent_id", inverse_of: :parent, dependent: :destroy
    accepts_nested_attributes_for :related_menus, :reject_if => lambda { |a| a[:menu_id].blank? }
    
    if Erp::Core.available?("products")
			has_and_belongs_to_many :categories, class_name: "Erp::Products::Category"
			belongs_to :brand_group, class_name: "Erp::Products::BrandGroup"
			
			# display brand group name
			def brand_group_name
				brand_group.present? ? brand_group.name : ''
			end
			
			def get_brand_groups
				brand_group.brand_group_details
			end
		end
    
    # class const
    MENU_TOP_BAR = 'menu_top_bar'
    MENU_SIDEBAR = 'menu_sidebar'
    MENU_HOT = 'menu_hot'
    
    STYLE_COLOR_1 = 'supper1'
    STYLE_COLOR_2 = 'supper2'
    STYLE_COLOR_3 = 'supper3'
    
    after_save :update_level
    
    def self.get_style_color_options()
      [
				{text: '', value: ''},
        {text: I18n.t('erp_menus_menus.dark_cyan'), value: STYLE_COLOR_1},
        {text: I18n.t('erp_menus_menus.outrageous_orange'), value: STYLE_COLOR_2},
        {text: I18n.t('erp_menus_menus.fruit_salad'), value: STYLE_COLOR_3}
      ]
    end
    
    def self.get_menu_type_options()
      [
        {text: I18n.t('erp_menus_menus.top_bar'), value: MENU_TOP_BAR},
        {text: I18n.t('erp_menus_menus.sidebar'), value: MENU_SIDEBAR},
        {text: I18n.t('erp_menus_menus.menu_hot'), value: MENU_HOT}
      ]
    end
    
    def self.get_active
			self.where(archived: false)
		end
    
    def self.get_menu_topbar
			self.get_active.where(menu_type: MENU_TOP_BAR)
					.where(parent_id: nil).first.children
		end
    
    def self.get_menu_sidebar
			self.get_active.where(menu_type: MENU_SIDEBAR)
					.where(parent_id: nil).first.children
		end
    
    def self.get_menu_search
			self.get_active.where(menu_type: MENU_SIDEBAR)
					.where(parent_id: nil).first.children
		end
    
    def self.get_menu_hot
			self.get_active.where(menu_type: MENU_HOT)
					.where(parent_id: nil).first.children
		end
    
    # Filters
    def self.filter(query, params)
      params = params.to_unsafe_hash
      and_conds = []
      
      # show archived items condition - default: false
			show_archived = false
			
			#filters
			if params["filters"].present?
				params["filters"].each do |ft|
					or_conds = []
					ft[1].each do |cond|
						# in case filter is show archived
						if cond[1]["name"] == 'show_archived'
							# show archived items
							show_archived = true
						else
							or_conds << "#{cond[1]["name"]} = '#{cond[1]["value"]}'"
						end
					end
					and_conds << '('+or_conds.join(' OR ')+')' if !or_conds.empty?
				end
			end
      
      #keywords
      if params["keywords"].present?
        params["keywords"].each do |kw|
          or_conds = []
          kw[1].each do |cond|
            or_conds << "LOWER(#{cond[1]["name"]}) LIKE '%#{cond[1]["value"].downcase.strip}%'"
          end
          and_conds << '('+or_conds.join(' OR ')+')'
        end
      end
      
      # join with users table for search creator
      query = query.joins(:creator)
      
      # join with parent menu for search menu
      query = query.joins("LEFT JOIN erp_menus_menus parents_erp_menus_menus ON parents_erp_menus_menus.id = erp_menus_menus.parent_id")
      
      # showing archived items if show_archived is not true
			query = query.where(archived: false) if show_archived == false

      query = query.where(and_conds.join(' AND ')) if !and_conds.empty?
      
      return query
    end
    
    def self.search(params)
      query = self.all
      query = self.filter(query, params)
      
      # order
      if params[:sort_by].present?
        order = params[:sort_by]
        order += " #{params[:sort_direction]}" if params[:sort_direction].present?
        
        query = query.order(order)
      end
      
      return query
    end
    
    # data for dataselect ajax
    def self.dataselect(keyword='')
      query = self.all
      
      if keyword.present?
        keyword = keyword.strip.downcase
        query = query.where('LOWER(name) LIKE ?', "%#{keyword}%")
      end
      
      query = query.limit(8).map{|menu| {value: menu.id, text: menu.name+ ' - ' + menu.menu_type} }
    end
    
    def archive
			update_columns(archived: true)
		end
		
		def unarchive
			update_columns(archived: false)
		end
    
    def self.archive_all
			update_all(archived: true)
		end
    
    def self.unarchive_all
			update_all(archived: false)
		end
    
    # display name
    def parent_name
			parent.present? ? parent.name : ''
		end      
    
    # get self and children ids
    def get_self_and_children_ids
      ids = [self.id]
      ids += get_children_ids_recursive
      return ids
		end
    
    # get children ids recursive
    def get_children_ids_recursive
      ids = []
      children.each do |c|
				if !c.children.empty?
					ids += c.get_children_ids_recursive
				end
				ids << c.id
			end
      return ids
		end
    
    def get_same_level_menus
			return self.parent.nil? ? Menu.where(level: 1) : self.parent.children
		end
    
    def get_related_sidebar_menus
			if self.children.empty?
				{
					menus: self.get_same_level_menus,
					parent: (self.get_same_level_menus.empty? or self.get_same_level_menus.first.parent.nil?) ? 'Chuyên mục' : self.get_same_level_menus.first.parent
				}
			else
				{
					menus: self.children,
					parent: self
				}
			end
		end
    
    if Erp::Core.available?("products")
			def get_products_for_categories(params)
				records = Erp::Products::Product.get_active
													.where(category_id: self.get_all_related_category_ids)
				return records
			end
			
			def get_all_related_category_ids
				category_ids = []
				menu_ids = self.get_self_and_children_ids
				menu_ids.each do |menu_id|
					menu = Menu.find(menu_id)
					menu.categories.each do |category|
						category_ids += category.get_self_and_children_ids
					end
				end
				return category_ids.uniq
			end
		end
    
    # init custom order
    def init_custom_order
			self.update_column(:custom_order, self.class.maximum("custom_order").to_i + 1)
		end
    
    # update level
    def update_level
			level = 1
			parent = self.parent
			while parent.present?
				level += 1
				parent = parent.parent
			end
			
			level
		end
  end
end
