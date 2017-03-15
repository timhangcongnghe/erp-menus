module Erp::Menus
  class Menu < ApplicationRecord
    validates :name, :menu_type, :presence => true
    belongs_to :creator, class_name: "Erp::User"
    belongs_to :parent, class_name: "Erp::Menus::Menu", optional: true
    has_many :children, class_name: "Erp::Menus::Menu", foreign_key: "parent_id"
    has_and_belongs_to_many :categories, class_name: "Erp::Products::Category"
    
    # class const
    MENU_TOP_BAR = 'top_bar'
    MENU_SIDEBAR = 'sidebar'
    MENU_HOT_CATEGORY_1 = 'menu_hot_category_1'
    MENU_HOT_CATEGORY_2 = 'menu_hot_category_2'
    MENU_HOT_CATEGORY_3 = 'menu_hot_category_3'
    MENU_HOT_CATEGORY_4 = 'menu_hot_category_4'
    MENU_HOT_CATEGORY_5 = 'menu_hot_category_5'
    MENU_HOT_CATEGORY_6 = 'menu_hot_category_6'
    MENU_HOT_CATEGORY_7 = 'menu_hot_category_7'
    MENU_HOT_CATEGORY_8 = 'menu_hot_category_8'
    MENU_HOT_CATEGORY_9 = 'menu_hot_category_9'
    MENU_HOT_CATEGORY_10 = 'menu_hot_category_10'
    
    def self.get_menu_type_options()
      [
        {text: I18n.t('erp_menus_menus.top_bar'), value: MENU_TOP_BAR},
        {text: I18n.t('erp_menus_menus.sidebar'), value: MENU_SIDEBAR},
        {text: I18n.t('erp_menus_menus.menu_hot_category_1'), value: MENU_HOT_CATEGORY_1},
        {text: I18n.t('erp_menus_menus.menu_hot_category_2'), value: MENU_HOT_CATEGORY_2},
        {text: I18n.t('erp_menus_menus.menu_hot_category_3'), value: MENU_HOT_CATEGORY_3},
        {text: I18n.t('erp_menus_menus.menu_hot_category_4'), value: MENU_HOT_CATEGORY_4},
        {text: I18n.t('erp_menus_menus.menu_hot_category_5'), value: MENU_HOT_CATEGORY_5},
        {text: I18n.t('erp_menus_menus.menu_hot_category_6'), value: MENU_HOT_CATEGORY_6},
        {text: I18n.t('erp_menus_menus.menu_hot_category_7'), value: MENU_HOT_CATEGORY_7},
        {text: I18n.t('erp_menus_menus.menu_hot_category_8'), value: MENU_HOT_CATEGORY_8},
        {text: I18n.t('erp_menus_menus.menu_hot_category_9'), value: MENU_HOT_CATEGORY_9},
        {text: I18n.t('erp_menus_menus.menu_hot_category_10'), value: MENU_HOT_CATEGORY_10}
      ]
    end
    
    def self.get_menu_topbar
			self.where(menu_type: MENU_TOP_BAR)
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
      
      query = query.limit(8).map{|menu| {value: menu.id, text: menu.name} }
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
  end
end
