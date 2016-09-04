class Item < ActiveRecord::Base
	has_many :item_packs, dependent: :destroy
	has_many :order_items

  validates :code, presence: true, uniqueness: true, allow_blank: false
  validates :name, presence: true, allow_blank: false
end
