class RenameOrderItemHistoriesPrice < ActiveRecord::Migration
  def change
  	rename_column :order_item_histories, :price, :price_per_pack
  end
end
