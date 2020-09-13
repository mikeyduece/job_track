module Secured
  before_action :authenticate_request!

  private

  def authenticate_request!
    verify_token
  end

  def verify_token
    JsonWebToken.verify(http_token)
  end

  def http_token
    headers = request.headers

    headers['Authorization'].split(' ').last if headers['Authorization'].present?
  end

end