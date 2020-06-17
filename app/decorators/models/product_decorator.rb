Erp::Products::Product.class_eval do
  # Find all menus of a product
	def find_menus
		self.category.nil? ? nil : self.category.menus
	end

	def find_menu
		if !self.find_menus.nil?
			all_menus = self.find_menus
			if self.brand_id.present?
				menus = all_menus.where(brand_id: self.brand_id)
			end
			menus = all_menus if menus.empty?
	
			menus.last
		end
	end
end