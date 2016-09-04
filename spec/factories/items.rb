FactoryGirl.define do
  factory :item do
    sequence(:code) { |n| "CODE#{n}" }
    name "Vegemite Scroll"

    after(:build) do |f|
      f.item_packs << FactoryGirl.create(:item_pack)
    end
  end
end
