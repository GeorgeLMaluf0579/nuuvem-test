# frozen_string_literal: true

FactoryBot.define do
  factory :purchase do
    order { create(:order) }
    item { create(:item) }
    merchant { create(:merchant) }
    purchaser { create(:purchaser) }
    quantity { 1 }
  end
end
