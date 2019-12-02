class AddLimitProductNameToErpMenusMenus < ActiveRecord::Migration[5.1]
  def change
    add_column :erp_menus_menus, :limit_product_name, :integer, default: 52
  end
end