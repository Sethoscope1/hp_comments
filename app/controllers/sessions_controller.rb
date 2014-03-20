class SessionsController < ApplicationController
  
  def create
    user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )
    
    if user.nil?
      flash[:errors] = ["Invalid Credentials"]
    else
      self.current_user = user
    end
    redirect_to "/"
  end
  
  def destroy
    logout_current_user!
    redirect_to new_session_url
  end
  
  def new
    @user = User.new
  end
end
