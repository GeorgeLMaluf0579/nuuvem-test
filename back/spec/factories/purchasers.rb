# frozen_string_literal: true

FactoryBot.define do
  factory :purchaser do
    name { Faker::Name.name }
  end
end
