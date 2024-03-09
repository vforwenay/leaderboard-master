# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ReceiverController, type: :routing do
  describe 'routing' do
    it 'routes to #leaderboard/token' do
      expect(post: '/receiver/leaderboard/token').to route_to('receiver#leaderboard', token: 'token')
    end
  end
end
