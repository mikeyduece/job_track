class ApplicationController < ActionController::API
  include DrySerialization::FastJsonapi
  include DrySerialization::Concerns::SerializationHelper
  include Secured

  rescue_from JWT::VerificationError, JWT::DecodeError do |exception|
    error_response(["Not Authenticated - message #{exception}"], :unauthorized)
  end

  def current_user
    @current_user ||= RequestStore.store[:current_user]
  end

end
