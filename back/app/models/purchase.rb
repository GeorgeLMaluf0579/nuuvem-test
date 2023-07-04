# frozen_string_literal: true

class Purchase < ApplicationRecord
  validates_presence_of :quantity

  belongs_to :order
  belongs_to :item
  belongs_to :merchant
  belongs_to :purchaser
end
