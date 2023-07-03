# frozen_string_literal: true

module Api
  module V1
    class OrdersController < ApplicationController
      before_action :find_order, only: %i[show]

      def index
        @orders = Order.all.order(id: :desc)
        render json: @orders, status: :ok
      end

      def show
        if @order.blank?
          render json: { message: 'Invalid order' }, status: :unprocessable_entity
        else
          render json: @order, status: :ok
        end
      end

      private

      def find_order
        @order = Order.find_by(id: params[:id])
      end
    end
  end
end
