# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OrderFileParser do
  context 'call' do
    subject(:service) { OrderFileParser.new(file) }

    context 'with an invalid file type' do
      let(:file) { fixture_file_upload('wrong.jpg') }
      it 'return MalformedCVSError' do
        expect { service.call }.to raise_error(CSV::MalformedCSVError)
      end
    end

    context 'with a valid tab file' do
      let(:file) { fixture_file_upload('input.txt') }

      it 'return the respective order with correct value and number of purchases' do
        service.call
        aggregate_failures do
          expect(service.order.value).to eq 102.95
          expect(service.order.purchases.count).to eq 5
        end
      end
    end
  end
end
