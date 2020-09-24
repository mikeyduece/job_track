class Api::V1::Profile::ProfileController < ApplicationController

  def show
    success_response(serialized_resource(current_user, UserSerializer, include: %i[applications]))
  end

end
