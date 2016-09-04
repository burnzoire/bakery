class OrderItemHistory < ActiveRecord::Base
  belongs_to :order_item
  belongs_to :item_pack
  has_one :item, through: :item_pack

  validates_numericality_of :quantity
  validates_numericality_of :price_per_pack

  def subtotal
  	quantity * price_per_pack
  end

end
