module Erp::Menus
  class Menu < ApplicationRecord
		include Erp::CustomOrder
		mount_uploader :menu_icon, Erp::Menus::MenuIconUploader
		mount_uploader :image_menu, Erp::Menus::MenuImageUploader

		validates :name, presence: true

		belongs_to :creator, class_name: 'Erp::User'
		belongs_to :parent, class_name: 'Erp::Menus::Menu', optional: true
		has_many :children, -> {order(custom_order: :asc)}, class_name: 'Erp::Menus::Menu', foreign_key: 'parent_id'
		belongs_to :redirect, class_name: 'Erp::Menus::Menu', foreign_key: 'redirect_id', optional: true
		has_and_belongs_to_many :categories, class_name: 'Erp::Products::Category'
		belongs_to :brand, class_name: 'Erp::Products::Brand', foreign_key: 'brand_id', optional: true
		has_and_belongs_to_many :properties_values, -> {order 'erp_products_properties_values.custom_order'}, class_name: 'Erp::Products::PropertiesValue', join_table: 'erp_menus_menus_properties_values'

		#START FOR FRONTEND
		def self.get_active
			where(archived: false).order('custom_order ASC')
		end

		def get_children
			children.get_active
		end

		def self.get_parent_menus
			get_active.where(parent_id: nil)
		end

		def self.get_hot_parent_menus
			get_parent_menus.where(is_hot: true)
	 end

		def self.get_laptop_menu
			find(464)
		end

		def get_products_for_categories(params)
			records = Erp::Products::Product.get_active.where(category_id: get_all_related_category_ids)
			if brand_id.present?
				records = records.where(brand_id: brand_id)
			end
			records = records.order('created_at desc')
			return records
		end

		def get_all_related_category_ids
			category_ids = []
			menu_ids = get_self_and_children_ids
			menu_ids.each do |menu_id|
				menu = Erp::Menus::Menu.find(menu_id)
				menu.categories.each do |category|
					category_ids += category.get_self_and_children_ids
				end
			end
			return category_ids.uniq
		end

		def get_self_and_children_ids
			ids = [id]
			ids += get_children_ids_recursive
			return ids
		end
		
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

		def self_and_parent_menus(options={})
			arr = [self]
			father = parent
			while father.present?
				arr << father
				father = father.parent
			end
			return arr.reverse
		end

		def menu_get_properties_array
			if (categories.count > 0)
				categories.first.category_get_properties_array
			end
		end

		def get_number_products
			records = Erp::Products::Product.get_active.where(category_id: get_all_related_category_ids)
			if brand_id.present?
				records = records.where(brand_id: brand_id)
			end
			return records.count
		end
		#END FOR FRONTEND

		def get_name
			name.present? ? name : ''
		end

		def get_short_name
			short_name.present? ? short_name : get_name
		end

		def get_parent_name
			parent.present? ? parent.get_name : ''
		end

		def get_custom_title
			custom_title.present? ? custom_title : get_short_name
		end

		def get_custom_alias
			custom_alias.present? ? custom_alias : ''
		end

		def get_redirect_name
			redirect.present? ? redirect.get_name : ''
		end

		def get_brand_name
			brand.present? ? brand.get_name : ''
		end

    def self.filter(query, params)
      params = params.to_unsafe_hash
      and_conds = []
			show_archived = false
			if params['filters'].present?
				params['filters'].each do |ft|
					or_conds = []
					ft[1].each do |cond|
						if cond[1]['name'] == 'show_archived'
							show_archived = true
						else
							if cond[1]['value'] == 'nil'
								or_conds << "#{cond[1]['name']} IS NULL"
							else
								or_conds << "#{cond[1]['name']} = '#{cond[1]['value']}'"
							end
						end
					end
					and_conds << '('+or_conds.join(' OR ')+')' if !or_conds.empty?
				end
			end
      if params['keywords'].present?
        params['keywords'].each do |kw|
          or_conds = []
          kw[1].each do |cond|
            or_conds << "LOWER(#{cond[1]['name']}) LIKE '%#{cond[1]['value'].downcase.strip}%'"
          end
          and_conds << '('+or_conds.join(' OR ')+')'
        end
      end
      query = query.joins(:creator)
      query = query.joins('LEFT JOIN erp_menus_menus parents_erp_menus_menus ON parents_erp_menus_menus.id = erp_menus_menus.parent_id')
			if show_archived == true
        query = query.where(archived: true)
      else
        query = query.where(archived: false)
      end
      query = query.where(and_conds.join(' AND ')) if !and_conds.empty?
      return query
    end

    def self.search(params)
      query = all
      query = filter(query, params)
      if params[:sort_by].present?
        order = params[:sort_by]
        order += " #{params[:sort_direction]}" if params[:sort_direction].present?
        query = query.order(order)
      end
      return query
    end

    def self.dataselect(keyword='')
      query = all
      if keyword.present?
        keyword = keyword.strip.downcase
        query = query.where('LOWER(cache_search) LIKE ?', "%#{keyword}%")
      end
      query = query.limit(8).map{|menu| {value: menu.id, text: (!menu.parent.present? ? '' : "#{menu.get_parent_name} / ") + menu.get_name}}
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

		after_save :create_alias
		after_save :update_cache_search
		after_save :update_level

		def create_alias
			if !not_create_link?
				if custom_alias.present?
					name = get_custom_alias
				else
					name = get_name
				end
				update_column(:alias, name.to_ascii.downcase.to_s.gsub(/[^0-9a-z \/\-\.]/i, '').gsub(/[ \/\.]+/i, '-').strip)
			end
		end

		def update_cache_search
			str = []
			str << name.to_s.downcase.strip
			update_column(:cache_search, str.join(' ') + ' ' + str.join(' ').to_ascii)
		end

		def update_level
			level = 1
			parent = parent
			while parent.present?
				level += 1
				parent = parent.parent
			end
			update_column(:level, level)
		end
  end
end