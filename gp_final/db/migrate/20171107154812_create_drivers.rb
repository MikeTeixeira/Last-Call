class CreateDrivers < ActiveRecord::Migration[5.1]
  def change
    create_table :drivers do |t|
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
