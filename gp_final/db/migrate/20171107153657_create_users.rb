class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :f_name
      t.string :l_name
      t.string :username
      t.string :password
      t.boolean :admin   , default: false


      t.timestamps
    end
  end
end
