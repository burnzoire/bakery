class CreateOrderItemHistories < ActiveRecord::Migration
  def change
    create_table :order_item_histories do |t|
      t.references :order_item, index: true, foreign_key: true
      t.integer :quantity
      t.float :price

      t.timestamps null: false
    end
  end
end
