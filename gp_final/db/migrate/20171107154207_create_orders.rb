class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.references :restaurant, foreign_key: true
      t.string :manifest
      t.string :pickup_name
      t.string :pickup_address
      t.string :pickup_phone_number
      t.string :pickup_business_name
      t.string :pickup_notes
      t.string :dropoff_name
      t.string :dropoff_address
      t.string :dropoff_phone_number
      t.string :dropoff_business_name
      t.text :dropoff_notes

      t.timestamps
      t.references :driver , index:true, foreign_key: false
    end
    add_foreign_key :driver , :user, column: :driver_id

      
    
  end
end

