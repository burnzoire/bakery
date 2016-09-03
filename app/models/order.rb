class Order < ActiveRecord::Base
  belongs_to :customer
  has_many :order_items, -> { order(:created_at, :asc)}

  validates_presence_of :customer
  accepts_nested_attributes_for :order_items, allow_destroy: true

  def total
  	#query order items and order items histories here.
  	42
  end
end
