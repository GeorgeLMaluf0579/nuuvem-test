# frozen_string_literal: true

RSpec.describe "Api::V1::Orders", type: :request do
  describe "GET /index" do
    it 'should be return ok' do
      get api_v1_orders_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /orders/:id' do
    let(:order) { create(:order) }

    it 'when exist request order' do
      aggregate_failures do
        get api_v1_order_path(id: order.id)
        expect(response).to have_http_status(200)
        expect(response.body).to eq (order).to_json
      end
    end

    it 'when does not exist request order' do
      aggregate_failures do
        get api_v1_order_path(id: 911)
        expect(response).to have_http_status(422)
        expect(response.body).to eq ({ message: "Invalid order"}).to_json
      end
    end
  end
end
