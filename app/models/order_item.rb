class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :item
  has_many :order_item_histories, autosave: true
  before_validation :build_order_item_histories

  validates_numericality_of :quantity

  default_scope { includes(:item) }

  def build_order_item_histories
  	# todo: calculate packs

  	order_item_histories.each do |h|
  		Rails.logger.debug "#{h.quantity} x #{h.item.code} @ #{h.price}"
  	end
  end

  def subtotal
    order_item_histories.sum(:price)
  end
  
end
