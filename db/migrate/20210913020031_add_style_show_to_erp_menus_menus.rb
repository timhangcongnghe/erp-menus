class AddStyleShowToErpMenusMenus < ActiveRecord::Migration[5.1]
  def change
    add_column :erp_menus_menus, :style_show, :boolean, default: false
  end
end