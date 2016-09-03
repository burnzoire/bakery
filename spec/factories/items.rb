FactoryGirl.define do
  factory :item do
    sequence(:code) { |n| "CODE#{n}" }
    name "Vegemite Scroll"
  end
end
