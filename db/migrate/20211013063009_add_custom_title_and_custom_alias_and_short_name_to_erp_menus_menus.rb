class AddCustomTitleAndCustomAliasAndShortNameToErpMenusMenus < ActiveRecord::Migration[5.1]
  def change
    add_column :erp_menus_menus, :custom_title, :string
    add_column :erp_menus_menus, :custom_alias, :string
    add_column :erp_menus_menus, :short_name, :string
  end
end