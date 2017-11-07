class CreateMenuItems < ActiveRecord::Migration[5.1]
  def change
    create_table :menu_items do |t|
      t.references :restaurant, foreign_key: true
      t.string :name
      t.string :category
      t.decimal :price
      t.text :description

      t.timestamps
    end
  end
end
