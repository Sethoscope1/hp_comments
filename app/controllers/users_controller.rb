class UsersController < ApplicationController
  before_filter :require_current_user!, except: [:new, :create]
  
  def create 
    @user = User.new(params[:user])
    if @user.save
      self.current_user = @user
    else
      flash[:errors] = @user.errors.full_messages 
    end
    
    render layout: "application", nothing: true
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
    @user = current_user 
    if @user.nil?
      @user = {}
    end
    
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
end
