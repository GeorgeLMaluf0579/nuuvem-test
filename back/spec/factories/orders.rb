# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    trait :with_a_purchase do
      after(:create) do |order|
        create_list :purchase, 1, order: order
      end
    end
  end
end
