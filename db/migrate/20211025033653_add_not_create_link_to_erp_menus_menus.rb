class AddNotCreateLinkToErpMenusMenus < ActiveRecord::Migration[5.1]
  def change
    add_column :erp_menus_menus, :not_create_link, :boolean, default: false
  end
end