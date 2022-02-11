def self.get_active
  self.where(archived: false).order('custom_order asc')
end

def self.get_parent_menus
  self.get_active.where(parent_id: nil)
end

def get_same_level_menus
  return self.parent.nil? ? Erp::Menus::Menu.where(level: 1) : self.parent.children
end

def get_related_sidebar_menus
  if self.children.empty?
    {menus: self.get_same_level_menus, parent: (self.get_same_level_menus.empty? or self.get_same_level_menus.first.parent.nil?) ? 'Chuyên mục' : self.get_same_level_menus.first.parent}
  else
    {menus: self.children, parent: self}
  end
end

def brands
  Erp::Products::Brand.where(id: self.get_products_for_categories({}).select(:brand_id).where.not(brand_id: nil)).order(:name)
end
    
def menu_get_properties_array
  if (self.categories.count > 0)
    self.categories.first.category_get_properties_array
  end
end

def count_keywords_arr
  arr = self.meta_keywords.split(', ') if self.meta_keywords.present?
  return arr.count
end

def self.select2(params=nil, limit=40)
  query = self.order('name asc')
  query = query.filter_by_keyword(params[:q]) if params[:q].present?
  query = query.limit(limit)
  return query.map{|menu| {value: menu.id, text: menu.name}}
end

def self.filter_by_keyword(kw)
  query = self.where("1=1")
  if kw.present?
    keyword = kw.strip.downcase
    keyword.split(' ').each do |q|
      q = q.strip
      query = query.where('LOWER(cache_search) LIKE ?', '%'+q+'%')
    end
  end
  return query
end

def get_children_array
  arr = []
  self.children.get_active.each do |child_1|
    arr << {menu: child_1, class: 'parent'}
    child_1.children.get_active.each do |child_2|
      arr << {menu: child_2, class: 'child'}
    end
  end
  arr
end

def self_and_parent_menus(options={})
  arr = [self]
  father = self.parent
  while father.present?
    arr << father
    father = father.parent
  end
  return arr.reverse
end

def get_products_without_sold_out
  records = Erp::Products::Product.get_active.where(category_id: self.get_all_related_category_ids)
  return records
end

def get_products_with_sold_out
  records = Erp::Products::Product
    .where(category_id: self.get_all_related_category_ids)
  return records
end

def get_products_for_categories(params)
  records = Erp::Products::Product.get_active.where(category_id: self.get_all_related_category_ids)
  if self.brand_id.present?
    records = records.where(brand_id: self.brand_id)
  end
  if params[:pv_ids].present?
    params.to_unsafe_hash[:pv_ids].each do |row|
      records = records.where(id: Erp::Products::ProductsValue.select(:product_id).where(properties_value_id: row[1]))
    end
  end
  records = records.order('created_at desc')
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

def get_self_and_children_ids
  ids = [self.id]
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