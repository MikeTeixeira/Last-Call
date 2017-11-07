class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.references :restaurant, foreign_key: true

      t.string :image
      t.integer :status
      t.decimal :cost
      t.datetime :arrival
      t.timestamps
      t.references :driver , index:true, foreign_key: false
    end
    add_foreign_key :driver , :user, column: :driver_id

      
    
  end
end
