# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Purchase, type: :model do
  let(:resource) { create(:purchase) }

  describe 'valid model' do
    it 'with valid attributes' do
      expect(resource).to be_valid
    end
  end

  describe 'invalid model' do
    context 'with an empty quantity' do
      let(:resource) { build(:purchase, quantity: nil) }
      it { expect(resource).to_not be_valid }
    end

    context 'with an empty item' do
      let(:resource) { build(:purchase, item: nil) }
      it { expect(resource).to_not be_valid }
    end

    context 'with an empty merchant' do
      let(:resource) { build(:purchase, merchant: nil) }
      it { expect(resource).to_not be_valid }
    end

    context 'with an empty purchaser' do
      let(:resource) { build(:purchase, purchaser: nil) }
      it { expect(resource).to_not be_valid }
    end

    context 'with an empty order' do
      let(:resource) { build(:purchase, order: nil) }
      it { expect(resource).to_not be_valid }
    end
  end
end
