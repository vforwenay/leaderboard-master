# frozen_string_literal: true

module ApplicationCable
  class Connection < ActionCable::Connection::Base

    def connect
      logger.add_tags 'ActionCable'
    end
  end
end
