class CreateMenuItemOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :menu_item_orders do |t|
      t.references :order, foreign_key: true
      t.references :menu_item, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
