# frozen_string_literal: true

# Receiver controller
class ReceiverController < ApplicationController
  before_action :authenticate_request

  def leaderboard
    params[:leaderboard].each do |leaderboard|
      begin
        Board.create!(board_params(leaderboard))
      rescue Exception => e
        return json_response({ message: "Invalid parameter: #{e.message}" }, :unprocessable_entity)
      end
    end
    json_response(Board.all.as_json)
  end

  def board_params(leaderboard)
    leaderboard.except(:pitting).permit(
      :driver_name,
      :car_number,
      :car_colour,
      :country,
      :last_lap,
      :position,
      :interval,
    )
  end
end
