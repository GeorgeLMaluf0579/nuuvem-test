# frozen_string_literal: true

module Api
  module V1
    class OrdersController < ApplicationController
      before_action :find_order, only: %i[show]

      def index
        @orders = OrdersService.new.list_orders
        render json: @orders, status: :ok
      end

      def show
#        if @order.blank?
#          render json: { message: 'Invalid order' }, status: :unprocessable_entity
#        else
#          render json: @order, status: :ok
#        end
      end

      def create
        order_file = params[:file]

        if order_file.present?
          order_parser = OrderFileParser.new(order_file).call
          if order_parser.order.value.zero?
            render json: { message: 'Unformated file' }, status: :unprocessable_entity
          else
            render json: { message: 'File uploaded' }, status: :ok
          end
        else
          render json: { error: 'No file uploaded' }, status: :unprocessable_entity
        end
      end

      private

      def find_order
        @order = Order.find_by(id: params[:id])
      end
    end
  end
end
