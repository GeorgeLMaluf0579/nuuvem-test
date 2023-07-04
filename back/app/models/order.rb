# frozen_string_literal: true

class Order < ApplicationRecord
  has_many :purchases

  def value
    purchases.includes(:item).sum('price * quantity')
  end
end
