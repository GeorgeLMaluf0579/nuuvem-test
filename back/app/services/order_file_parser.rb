# frozen_string_literal: true

require 'csv'

class OrderFileParser
  attr_reader :order

  def initialize(file)
    @file = file
    @content_type = file.content_type
    @order = nil
  end

  def call
    ActiveRecord::Base.transaction do
      @order = Order.create
      CSV.foreach(@file, headers: true, col_sep: "\t") do |row|
        item = Item.find_or_create_by(description: row['item description'], price: row['item price'])
        merchant = Merchant.find_or_create_by(name: row['merchant name'], address: row['merchant address'])
        purchaser = Purchaser.find_or_create_by(name: row['purchaser name'])
        purchase = Purchase.create(order: @order, item: item, merchant: merchant, purchaser: purchaser,
                                   quantity: row['purchase count'])
      end
    end
  end
end
