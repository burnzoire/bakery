class OrderItemHistory < ActiveRecord::Base
  belongs_to :order_item

  validates_numericality_of :quantity
  validates_numericality_of :price

end
