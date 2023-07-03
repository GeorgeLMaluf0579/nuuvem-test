# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:resource) { create(:order) }

  describe 'valid model' do
    it 'with valid attributes' do
      expect(resource).to be_valid
    end

    it 'result a zero value' do
      expect(resource.value).to eq 0
    end
  end

  describe 'valid model with a purchase' do
    let(:resource) { create(:order, :with_a_purchase) }

    it 'must have one purchase' do
      expect(resource.purchases.count).to eq 1
    end

    context '#value' do
      let(:result) { resource.purchases[0].item.price * resource.purchases[0].quantity }
      it 'must be have the same result' do
        expect(resource.value).to eq result
      end
    end
  end
end
