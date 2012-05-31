class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :require_http_basic_auth

  def require_http_basic_auth
    authenticate_or_request_with_http_basic do |login, password|
      if login == "echoboard" && password == "echoboardpassword"
        true
      end
    end
  end
end