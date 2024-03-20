class ApplicationController < ActionController::Base
  before_action :basic_suth

  private

  def basic_suth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password =='2222'
    end
  end
end
