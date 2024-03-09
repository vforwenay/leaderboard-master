# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ReceiverController, type: :controller do
  let(:valid_attributes) do
    attributes_for(:board)
  end

  let(:invalid_attributes) { attributes_for(:board, driver_name: nil) }

  describe 'POST #leaderboard' do
    context 'with valid params' do
      it 'returns a success response' do
        post :leaderboard, params: {
          token: 'FT7E3Y68UPA6'.to_param,
          leaderboard: [valid_attributes]
        }
        expect(response).to be_successful
      end

      it 'creates a new entry' do
        expect do
          post :leaderboard, params: {
            token: 'FT7E3Y68UPA6'.to_param,
            leaderboard: [valid_attributes]
          }
        end.to change(Board, :count).by(1)
      end
    end

    context 'with invalid params' do
      it 'returns an unauthorized response with invalid token' do
        post :leaderboard, params: {
          token: 'test'.to_param,
          leaderboard: [valid_attributes]
        }
        expect(response.status).to eql 401
      end

      it 'return validation error with invalid attributes' do
        post :leaderboard, params: {
          token: 'FT7E3Y68UPA6'.to_param,
          leaderboard: [invalid_attributes]
        }
        expect(response.status).to eql 422
      end
    end
  end
end
