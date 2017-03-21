class CreateErpMenusMenus < ActiveRecord::Migration[5.0]
  def change
    create_table :erp_menus_menus do |t|
      t.string :name
      t.integer :parent_id
      t.string :menu_type
      t.string :style_icon
      t.string :style_color
      t.string :image_url
      t.string :image_product_link
      t.text :description
      t.text :meta_keywords
      t.text :meta_description
      t.boolean :archived, default: false
      t.references :creator, index: true, references: :erp_users
      t.references :brand_group, index: true, references: :erp_products_brand_groups

      t.timestamps
    end
  end
end
