class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :item
  has_many :order_item_histories, autosave: true, dependent: :destroy
  before_validation :build_order_item_histories

  validates_numericality_of :quantity
  
  default_scope { includes(:item) }

  def build_order_item_histories
    amount = quantity
    item.item_packs.order("quantity DESC").each do |pack|
      amount -= pack.quantity * (count = amount / pack.quantity)
      if(count > 0)
        Rails.logger.debug "#{count} x #{pack.quantity} @ #{pack.price}"
        order_item_histories << OrderItemHistory.new(item_pack_id: pack.id, quantity: count, price_per_pack: pack.price)
      end
    end
    errors.add(:quantity, "should be devisible by lots of #{lots.join(" or ")}") if amount > 0
  end

  def lots
    item.item_packs.pluck(:quantity)
  end

  def subtotal
    # sum all history subtotals
    order_item_histories.map{|h| h.subtotal}.inject(0){|sum,v| sum + v }
  end
  

end
