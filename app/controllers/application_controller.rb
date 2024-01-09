class ApplicationController < ActionController::API
  include Api::ExceptionHandler
  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_action :authenticate

  protected

  def authenticate
    authenticate_or_request_with_http_token do |token, _options|
      @_current_user ||= ApiKey.active.find_by(access_token: token)&.user
    end
  end

  def current_user
    @_current_user
  end

  private

  def form_authenticity_token; end
end
