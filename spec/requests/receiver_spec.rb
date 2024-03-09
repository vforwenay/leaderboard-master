# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Receiver', type: :request do
  describe 'Post /receiver/leaderboard' do
    let(:board) { attributes_for(:board) }

    it 'works!' do
      post leaderboard_path(token: 'FT7E3Y68UPA6'), params: { board: board }
      expect(response).to have_http_status(200)
    end
  end
end
