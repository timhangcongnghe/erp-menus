class CreateErpMenusMenusPropertiesValues < ActiveRecord::Migration[5.1]
  def change
    create_table :erp_menus_menus_properties_values do |t|
      t.references :menu, index: true, references: :erp_menus_menus
      t.references :properties_value, index: true, references: :erp_products_properties_values
      t.timestamps
    end
  end
end