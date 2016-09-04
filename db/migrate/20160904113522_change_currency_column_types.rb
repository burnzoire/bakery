class ChangeCurrencyColumnTypes < ActiveRecord::Migration
  
  def self.up
    change_column :item_packs, :price, :decimal, precision: 8, scale: 2
    change_column :order_item_histories, :price_per_pack, :decimal, precision: 8, scale: 2
  end
  
  def self.down
    change_column :item_packs, :price, :float
    change_column :order_item_histories, :price_per_pack, :float
  end
  
end
