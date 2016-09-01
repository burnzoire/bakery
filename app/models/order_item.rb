class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :item
  has_many :order_item_history

  validates_numericality_of :quantity
end
