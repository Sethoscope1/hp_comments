class SessionsController < ApplicationController
  
  def create
    user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )
    
    if user.nil?
      flash[:error] = ["Invalid Credentials"]
      redirect_to new_session_url
    else
      self.current_user = user
      redirect_to articles_url
    end
  end
  
  def destroy
    logout_current_user!
    redirect_to new_session_url
  end
  
  def new
    @user = User.new
  end
end
