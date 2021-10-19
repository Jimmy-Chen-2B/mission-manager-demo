class SessionsController < ApplicationController
  def create
    pw = user_params[:password]
    salted_pw = "aovger#{pw}348950#{pw}sfj246-540zco"
    hashed_pw = Digest::SHA1.hexdigest(salted_pw)
    
    user = User.find_by(email: user_params[:email], 
                        password: hashed_pw 
                       ) 
    if user
      session[:rubyisgoodforlife] = user.id
      redirect_to root_path
    else
      redirect_to sign_in_users_path  
    end                   
  end

  def destroy
    session[:rubyisgoodforlife] = nil
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
