FactoryGirl.define do
  factory :order do
    customer

    trait :demo do
      after(:build) do |order|
        order.order_items << FactoryGirl.create(:order_item, order: order, quantity: 10, item: FactoryGirl.create(:vegemite_scroll))
        order.order_items << FactoryGirl.create(:order_item, order: order, quantity: 14, item: FactoryGirl.create(:blueberry_muffin))
        order.order_items << FactoryGirl.create(:order_item, order: order, quantity: 13, item: FactoryGirl.create(:croissant))
      end
    end

    factory :order_demo, traits: [:demo]
  end
end
