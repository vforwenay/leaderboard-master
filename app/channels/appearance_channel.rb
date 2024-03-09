class AppearanceChannel < ApplicationCable::Channel
  def subscribed
    stream_from "leaderboard_update"
  end

  def unsubscribed
    stop_all_streams
  end
end
