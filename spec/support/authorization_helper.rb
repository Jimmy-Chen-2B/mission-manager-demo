module AuthorizationHelper
  # def login_as_admin
  #   admin = FactoryBot.create(:user_admin)
  #   login_as(admin)
  # end

  def login(user)
    request.session[:rubyisgoodforlife] = user.id
  end
end

RSpec.configure do |config|
  config.include AuthorizationHelper, :type => :controller
end