class CreateErpMenusMenus < ActiveRecord::Migration[5.0]
  def change
    create_table :erp_menus_menus do |t|
      t.string :name
      t.integer :parent_id
      t.string :menu_type
      t.boolean :archived, default: false
      t.references :creator, index: true, references: :erp_users

      t.timestamps
    end
  end
end
