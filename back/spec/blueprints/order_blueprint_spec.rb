# frozen_string_literal: true

require 'rails_helper'

describe OrderBlueprint do
  let(:order) { create(:order) }
  let(:response) { OrderBlueprint.render(order)}

  describe 'default' do
    it { expect(response).to match_json_schema('order/default') }
  end
end