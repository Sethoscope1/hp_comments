class UsersController < ApplicationController
  before_filter :require_current_user!, except: [:new, :create]
  
  def create 
    @user = User.new(params[:user])
    
    if @user.save
      self.current_user = @user
      redirect_to articles_url
    else
      flash[:error] = @user.errors.full_messages 
    end
  end
  
  def new
    @user = User.new
  end
  
  def show
    @user = User.find(current_user.id)
    
    respond_to do |format|
      format.html
      format.json { render json: @user }
    end
  end
  
  def index
    @users = User.all
    respond_to do |format|
      format.html { render json: @users }
      format.json { render json: @users }
    end
  end
  
  def currentUser
    @user = current_user || nil
    
    respond_to do |format|
      format.html { render json: @user }
      format.json { render json: @user }
    end
  end
  
  def badges
    @badges = current_user.badges || []
    
    respond_to do |format|
      format.html { render json: @badges }
      format.json { render json: @badges }
    end
  end
    
  private
  
  # def user_params
  #   params.require(:user)
  # end
end
