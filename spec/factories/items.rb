FactoryGirl.define do
  factory :item do
    sequence(:code) { |n| "CODE#{n}" }
    name "Vegemite Scroll"

    trait :vs5 do
      name "Vegemite Scroll"
      code "VS5"

      after(:create) do |item|
        item.item_packs << FactoryGirl.create(:item_pack, item: item, quantity: 3, price: 6.99)
        item.item_packs << FactoryGirl.create(:item_pack, item: item, quantity: 5, price: 8.99)
      end
    end

    trait :mb11 do
      name "Blueberry Muffin"
      code "MB11"

      after(:create) do |item|
        item.item_packs << FactoryGirl.create(:item_pack, item: item, quantity: 2, price: 9.95)
        item.item_packs << FactoryGirl.create(:item_pack, item: item, quantity: 5, price: 16.95)
        item.item_packs << FactoryGirl.create(:item_pack, item: item, quantity: 8, price: 24.95)
      end
    end

    trait :cf do
      name "Croissant"
      code "CF"

      after(:create) do |item|
        item.item_packs << FactoryGirl.create(:item_pack, item: item, quantity: 3, price: 5.95)
        item.item_packs << FactoryGirl.create(:item_pack, item: item, quantity: 5, price: 9.95)
        item.item_packs << FactoryGirl.create(:item_pack, item: item, quantity: 9, price: 16.99)
      end

    end

    factory :vegemite_scroll, traits: [:vs5]
    factory :blueberry_muffin, traits: [:mb11]
    factory :croissant, traits: [:cf]
  end
end
