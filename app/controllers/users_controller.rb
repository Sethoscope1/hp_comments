class UsersController < ApplicationController
  before_filter :require_current_user!, except: [:new, :create]
  
  def create 
    @user = User.new(params[:user])
    
    if @user.save
      self.current_user = @user
      redirect_to user_url(@user)
    else
      render :json => @user.errors.full_messages
    end
  end
  
  def new
    @user = User.new
  end
  
  def show
    if params.include?(:id)
      @user = User.find(params[:id])
    else
      redirect_to user_url(current_user)
    end
  end
  
  private
  
  # def user_params
  #   params.require(:user)
  # end
end
