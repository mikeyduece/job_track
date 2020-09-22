module Secured
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_request!
  end

  private

  def authenticate_request!
    token = auth_token
    email = get_email(token)
    RequestStore.store[:current_user] ||= User.find_by(email: email)
    token
  end

  def http_token
    request.headers['Authorization'].split(' ').last if request.headers['Authorization'].present?
  end

  def auth_token
    JsonWebToken.verify(http_token)
  end

  def get_email(token)
    JsonWebToken.get_claim(token, 'email')
  end

end