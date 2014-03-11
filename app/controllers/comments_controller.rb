class CommentsController < ApplicationController
  
  def index
    @comments = Comment.all

    respond_to do |format|
      format.html
      format.json { render json: @comments }
    end
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
      render json: @comment
    else
      render json: @comment.to_json, status: :unprocessable_entity
    end
  end
  
  def update
    @comment = Comment.find(params[:id])
    
    if @comment.update_attributes(params[:comment])
      flash.notice = "Comment updated!"
  
      redirect_to article_url(@comment)
    end
  end
  
  def upvote
    @comment_favorite = CommentFavorite.where(user_id: current_user.id, comment_id: params[:id])[0]
    if @comment_favorite
      @comment_favorite.update_attributes(value: (@comment_favorite.value == 1 ? 0 : 1))
    else
      CommentFavorite.create!(user_id: current_user.id, comment_id: params[:id], value: 1)
    end
    render json: @comment_favorite
  end
  
  def downvote
    @comment_favorite = CommentFavorite.where(user_id: current_user.id, comment_id: params[:id])[0]
    if @comment_favorite
      @comment_favorite.update_attributes(value: (@comment_favorite.value == -1 ? 0 : -1))
      render json: @comment_favorite
    else
      @comment_favorite = CommentFavorite.create!(user_id: current_user.id, comment_id: params[:id], value: -1)
      render json: @comment_favorite
    end
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @article = @comment.article
    if @comment.destroy
      render json: @comment
    else
      render json: @comment.to_json, status: :unprocessable_entity
    end
  end
end