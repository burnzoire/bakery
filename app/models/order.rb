class Order < ActiveRecord::Base
  belongs_to :customer
  has_many :order_items, -> { order("created_at ASC")}
  has_many :order_item_histories, through: :order_items

  validates_presence_of :customer
  accepts_nested_attributes_for :order_items, allow_destroy: true

  def total
  	# sum all history subtotals
    order_item_histories.map{|h| h.subtotal}.inject(0){|sum,v| sum + v }
  end
end
