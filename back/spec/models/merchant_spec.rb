# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Merchant, type: :model do
  let(:resource) { create(:merchant) }
  describe 'valid model' do
    it 'with valid attributes' do
      expect(resource).to be_valid
    end
  end

  describe 'invalid model' do
    context 'with an empty model' do
      let(:resource) { build(:merchant, name: nil, address: nil) }
      it { expect(resource).to_not be_valid }
    end

    context 'with an empty name' do
      let(:resource) { build(:merchant, name: nil) }
      it { expect(resource).to_not be_valid }
    end

    context 'with an empty address' do
      let(:resource) { build(:merchant, address: nil) }
      it { expect(resource).to_not be_valid }
    end
  end
end
