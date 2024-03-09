# frozen_string_literal: true

# Application controller
class ApplicationController < ActionController::API
  include ResponseHandler
  include ExceptionHandler

  def authenticate_request
    return true if valid_token?

    json_response({ message: 'Unauthorized request' }, :unauthorized)
  end

  private

  def valid_token?
    params[:token] && params[:token] == 'FT7E3Y68UPA6'
  end
end
