class ItemPack < ActiveRecord::Base
  belongs_to :item

  validates_numericality_of :quantity
  validates_numericality_of :price
end
