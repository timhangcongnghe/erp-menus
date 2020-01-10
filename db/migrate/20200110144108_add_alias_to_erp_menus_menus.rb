class AddAliasToErpMenusMenus < ActiveRecord::Migration[5.1]
  def change
    add_column :erp_menus_menus, :alias, :string
  end
end