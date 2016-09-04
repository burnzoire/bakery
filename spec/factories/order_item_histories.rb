FactoryGirl.define do
  factory :order_item_history do
    order_item
    quantity 1
    item_pack
    price_per_pack 1.5
  end
end
