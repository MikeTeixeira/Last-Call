class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants do |t|
      t.references :rating, foreign_key: true
      t.references :menu_item, foreign_key: true
      t.string :name
      t.text :description
      t.integer :category
      t.string :phone_number
      t.string :location
      t.string :open_hours
      t.string :close_hours

      t.timestamps
    end
  end
end
