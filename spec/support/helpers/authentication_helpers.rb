module AuthenticationHelpers

  def login_as_user
    user = create(:user)
    allow(ApplicationController).to receive(:authenticate_request!).and_return(true)
    allow(ApplicationController).to receive(:current_user).and_return(user)
  end
end