# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Purchaser, type: :model do
  let(:resource) { create(:purchaser) }
  describe 'valid model' do
    it 'with valid attributes' do
      expect(resource).to be_valid
    end
  end

  describe 'invalid model' do
    context 'with an empty model' do
      let(:resource) { build(:merchant, name: nil) }
      it { expect(resource).to_not be_valid }
    end
  end
end
