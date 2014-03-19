class UserBadgesController < ApplicationController
  
  def index
    if current_user
      @user_badges = current_user.badges
    else
      @user_badges = []
    end
    
    render json: @user_badges
  end
end
