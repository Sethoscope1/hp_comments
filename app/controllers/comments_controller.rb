class CommentsController < ApplicationController
  
  def index
    @comments = Comment.all
  end
  
  def show
    @comment = Comment.find(params[:id])
  end
  
  def new
   @comment = Comment.new(:parent_id => params[:parent_id])
  end
  
  def edit
    @comment = Comment.find(params[:id])
  end
  
  def create
    @comment = Comment.new(params[:comment])
    @comment.user = current_user
    
    if @comment.save
      flash.notice = "Comment Created"
      redirect_to article_url(@comment.article_id)
    else
      flash[:error] = @comment.errors.full_messages
      flash.notice = "Couldn't Create Comment"
      redirect_to article_url(@comment.article_id)
    end
  end
  
  def update
    @comment = Comment.find(params[:id])
    
    if @comment.update_attributes(params[:comment])
      flash.notice = "Comment updated!"
  
      redirect_to article_url(@comment)
    end
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @article = @comment.article
    @comment.destroy
    flash.notice = "Comment destroyed!"
    
    redirect_to article_url(@article)
  end
end