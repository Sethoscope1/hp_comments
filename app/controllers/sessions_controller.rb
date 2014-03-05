class SessionsController < ApplicationController
  
  def create
    user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )
    
    if user.nil?
      render json: "Invalid Credentials"
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
  end
end
