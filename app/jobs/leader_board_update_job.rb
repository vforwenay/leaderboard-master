class LeaderBoardUpdateJob < ApplicationJob
  queue_as :default

  def perform
    ActionCable.server.broadcast 'leaderboard_update', {leaderboard: leaderboard}
  end

  def leaderboard
    Board.all.order(:last_lap).last(10).as_json(only: [:driver_name, :car_number, :car_color, :position, :last_lap])
  end
end
