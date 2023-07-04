# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:resource) { create(:item) }

  describe 'valid model' do
    it 'with valid attributes' do
      expect(resource).to be_valid
    end
  end

  describe 'invalid model' do
    context 'with an empty model' do
      let(:resource) { build(:item, description: nil, price: nil) }
      it { expect(resource).to_not be_valid }
    end

    context 'with an empty description' do
      let(:resource) { build(:item, description: nil) }
      it { expect(resource).to_not be_valid }
    end

    context 'with an empty price' do
      let(:resource) { build(:item, price: nil) }
      it { expect(resource).to_not be_valid }
    end
  end
end
