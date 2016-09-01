class Order < ActiveRecord::Base
  belongs_to :customer
  has_many :order_items

  validates_presence_of :customer
end
