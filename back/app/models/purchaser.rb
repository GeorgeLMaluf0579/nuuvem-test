# frozen_string_literal: true

class Purchaser < ApplicationRecord
  validates_presence_of :name
end
