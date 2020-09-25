module Secured
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_request!
  end

  private

  def authenticate_request!
    token = auth_token
    email = get_claim(:email)
    RequestStore.store[:current_user] ||= User.find_by(email: email)
    token
  end

  def http_token
    request.headers['Authorization'].split(' ').last if request.headers['Authorization'].present?
  end

  def auth_token
    JsonWebToken.verify(http_token)
  end

  def get_email(claim)
    JsonWebToken.get_claim(auth_token, claim)
  end

end