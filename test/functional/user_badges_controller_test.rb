require 'test_helper'

class UserBadgesControllerTest < ActionController::TestCase
  def index
    @userBadges = current_user.badges
    
    respond_to do |format|
      format.html { render json: @userBadges }
      format.json { render json: @userBadges }
    end
  end
end
