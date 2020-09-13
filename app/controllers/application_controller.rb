class ApplicationController < ActionController::API

  rescue_from JWT::VerificationError, JWT::DecodeError do |exception|
    render json: { errors: ["Not Authenticated - message #{exception}"] }, status: :unauthorized
  end
end
