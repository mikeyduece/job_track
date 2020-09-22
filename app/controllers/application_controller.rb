class ApplicationController < ActionController::API
  include Secured

  rescue_from JWT::VerificationError, JWT::DecodeError do |exception|
    render json: { errors: ["Not Authenticated - message #{exception}"] }, status: :unauthorized
  end

  def current_user
    @current_user ||= RequestStore.store[:current_user]
  end

end
