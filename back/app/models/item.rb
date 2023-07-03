# frozen_string_literal: true

class Item < ApplicationRecord
  validates_presence_of :description
  validates_presence_of :price
end
