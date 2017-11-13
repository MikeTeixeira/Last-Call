class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change


    create_table :restaurants do |t|
      t.string :name
      t.text :description
      t.integer :category
      t.string :phone_number
      t.string :address
      t.string :state
      t.string :city
      t.string :zipcode
      t.string :open_hours
      t.string :close_hours
      t.float :longitude
      t.float :latitude
      t.attachment :image

      t.references :user, foreign_key: true

      
      t.timestamps
    end

  end

end
