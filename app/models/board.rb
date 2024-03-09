# frozen_string_literal: true

class Board < ApplicationRecord
  validates_presence_of :driver_name, :car_number, :car_colour

  after_save :update_leaderboard

  def update_leaderboard
    LeaderBoardUpdateJob.perform_now
  end
end
