# frozen_string_literal: true

FactoryBot.define do
  factory :item do
    description { Faker::Commerce.product_name }
    price { Faker::Commerce.price(range: 0..10.0, as_string: true) }
  end
end
