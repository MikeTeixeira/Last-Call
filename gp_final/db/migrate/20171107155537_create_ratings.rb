class CreateRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :ratings do |t|
      t.references :user, foreign_key: true
      t.references :restaurant, foreign_key: true
      t.text :review
      t.integer :restaurant_rating

      t.timestamps
    end
  end
end
