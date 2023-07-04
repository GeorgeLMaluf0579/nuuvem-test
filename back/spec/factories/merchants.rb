# frozen_string_literal: true

FactoryBot.define do
  factory :merchant do
    name { Faker::Name.name }
    address { Faker::Address.street_name }
  end
end
