class AddIsRedirectAndRedirectIdToErpMenusMenus < ActiveRecord::Migration[5.1]
  def change
    add_column :erp_menus_menus, :is_redirect, :boolean, default: false
    add_column :erp_menus_menus, :redirect_id, :integer
  end
end