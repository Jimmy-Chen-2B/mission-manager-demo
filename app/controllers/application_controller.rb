class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  helper_method :user_signed_in?, :current_user
  
  private

  def user_signed_in?
    session[:rubyisgoodforlife] != nil
  end

  def current_user
    if user_signed_in?
      User.find(session[:rubyisgoodforlife])
    else
      nil
    end
  end

  def authenticate_user!
    if not user_signed_in?
      redirect_to login_path
    end
  end

  def record_not_found
    render file "public/404.html", status: :not_found
  end
end
