class CreateRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :ratings do |t|
      t.references :order, foreign_key: true
      t.text :review
      t.integer :restaurant_rating

      t.timestamps
    end
  end
end
