FactoryGirl.define do
  factory :order_item_history do
    order_item
    quantity 1
    price 1.5
  end
end
