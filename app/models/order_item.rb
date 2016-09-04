class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :item
  has_many :order_item_histories, autosave: true, dependent: :destroy
  before_validation :build_order_item_histories

  validates_numericality_of :quantity
  
  default_scope { includes(:item) }

  
  # parse quantity to build line items of packs
  def build_order_item_histories
    return if item.nil?

    denominations = item.item_packs.pluck(:quantity).sort!.reverse

    # get quantities of each pack
    quantities = Hash.new(0)
    make_change(quantity, denominations).each do |q|
      quantities[q] += 1
    end

    # add history per pack - price stored for historic integrity
    # todo: find_or_initialize to allow editing existing histories
    item.item_packs.order("quantity DESC").each do |pack|
      params = {
        item_pack_id: pack.id,
        quantity: quantities[pack.quantity],
        price_per_pack: pack.price
      }
      order_item_histories << OrderItemHistory.new(params) if quantities[pack.quantity] > 0
    end
    
    errors.add(:quantity, "needs to fit packs of #{denominations.join(" or ")}") if quantities.empty?
  end

  def subtotal
    # sum all history subtotals
    order_item_histories.map{|h| h.subtotal}.inject(0){|sum,v| sum + v }
  end

private

  # background: greedy-first solution insufficient for lists of any denomination
  # optimal change solution based on http://rubyquiz.com/quiz154.html
  def make_change(a, list = [25, 10, 5, 1])
    return [] if a < 0
    return [] if a != a.floor

    parents = Array.new(a + 1)
    parents[0] = 0
    worklist = [[0, 0]]
    while parents[a].nil? && !worklist.empty? do
      base, starting_index = worklist.shift
      starting_index.upto(list.size - 1) do |index|
        denomination = list[index]
        tot = base + denomination
        if tot <= a && parents[tot].nil?
          parents[tot] = base
          worklist << [tot, index]
        end
      end
    end

    return [] if parents[a].nil?
    result = []
    while a > 0 do
      parent = parents[a]
      result << a - parent
      a = parent
    end
    result.sort!.reverse!
  end
end
