module Auth
  module Credentials
    private

    def environment
      Rails.env.to_sym
    end

    def credentials
      Rails.application.credentials[environment]
    end

    def auth0_credentials
      credentials[:auth0]
    end
  end

end
