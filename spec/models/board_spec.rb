# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Board, type: :model do
  context 'validations' do
    context 'valid factories present' do
      it { build(:board).should be_valid }
    end

    context 'driver_name' do
      context 'should be valid' do
        let(:valid) { build(:board, driver_name: 'Pagenaud') }
        it { expect(valid).to be_valid }
      end

      context 'should be invalid' do
        let(:invalid) { build(:board, driver_name: nil) }
        it { expect(invalid).not_to be_valid }
      end
    end

    context 'car_number' do
      context 'should be valid' do
        let(:valid) { build(:board, car_number: 10) }
        it { expect(valid).to be_valid }
      end

      context 'should be invalid' do
        let(:invalid) { build(:board, car_number: nil) }
        it { expect(invalid).not_to be_valid }
      end
    end

    context 'car_colour' do
      context 'should be valid' do
        let(:valid) { build(:board, car_colour: '#FFFFFF') }
        it { expect(valid).to be_valid }
      end

      context 'should be invalid' do
        let(:invalid) { build(:board, car_colour: nil) }
        it { expect(invalid).not_to be_valid }
      end
    end
  end
end
