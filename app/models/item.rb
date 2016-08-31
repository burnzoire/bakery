class Item < ActiveRecord::Base
	has_many :item_packs
	has_many :order_items
end
