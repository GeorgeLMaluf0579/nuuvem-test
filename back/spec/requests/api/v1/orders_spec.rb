# frozen_string_literal: true

RSpec.describe "Api::V1::Orders", type: :request do
  describe "GET /index" do
    it 'should be return ok' do
      get api_v1_orders_path
      expect(response).to have_http_status(:ok)
    end
  end

  # describe 'GET /orders/:id' do
  #   let(:order) { create(:order) }

  #   it 'when exist request order' do
  #     aggregate_failures do
  #       get api_v1_order_path(id: order.id)
  #       expect(response).to have_http_status(:ok)
  #       expect(response.body).to eq (order).to_json
  #     end
  #   end

  #   it 'when does not exist request order' do
  #     aggregate_failures do
  #       get api_v1_order_path(id: 911)
  #       expect(response).to have_http_status(:unprocessable_entity)
  #       expect(response.body).to eq ({ message: "Invalid order"}).to_json
  #     end
  #   end
  # end

  describe 'POST /orders/' do
    context 'when a valid file is uploaded' do
      let(:file) { fixture_file_upload('input.txt', 'text/plain') }

      before do
        post api_v1_orders_path, params: { file: file }
      end

      it 'expected response and success message' do
        aggregate_failures do
          expect(response).to have_http_status(:ok)
          expect(response.body).to eq ({ message: 'File uploaded' }).to_json
        end
      end
    end

    context 'when a unformated file is uploded' do
      let(:file) { fixture_file_upload('unformated.txt', 'text/plain') }

      before do
        post api_v1_orders_path, params: { file: file }
      end

      it 'expected response and unformated message' do
        aggregate_failures do
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.body).to eq ({message: 'Unformated file'}).to_json
        end
      end
    end

    context 'when no file is uploaded' do
      before do
        post api_v1_orders_path
      end

      it 'expected response and fail error' do
        aggregate_failures do
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.body).to eq ({ error: 'No file uploaded' }).to_json
        end
      end
    end
  end
end
