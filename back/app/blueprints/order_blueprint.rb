# frozen_string_literal: true

class OrderBlueprint < Blueprinter::Base
  fields :id, :created_at, :updated_at, :value
end
