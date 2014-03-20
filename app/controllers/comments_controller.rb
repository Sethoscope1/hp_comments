class CommentsController < ApplicationController
  
  def index
    @comments = Comment.where(article_id: params[:article_id]).sort_by { |comment| comment.created_at }.reverse
    
    @comments.each do |comment|
      comment.update_attributes({upvoted: upvoted?(comment), downvoted: downvoted?(comment)})
    end

    render json: @comments
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
    @comment = Comment.new(format_params(params))
    @comment.score = 0
    if @comment.save
      render json: @comment
    else
      render json: @comment.to_json, status: :unprocessable_entity
    end
  end
  
  def update
    @comment = Comment.find(params[:id])
    
    if @comment.update_attributes(format_params(params))
      flash.notice = "Comment updated!"     
      render json: @comment
    else
      render json: @comment.to_json, status: :unprocessable_entity
    end
  end
  
  def upvote
    @comment_favorite = CommentFavorite.where(user_id: current_user.id, comment_id: params[:id])[0]
    @comment = Comment.find(params[:id])
    if @comment_favorite
      @comment_favorite.update_attributes(value: (@comment_favorite.value == 1 ? 0 : 1))
      @comment.update_attributes(score: get_value(@comment), upvoted: @comment_favorite.value == 1 ? true : false, downvoted: false)
    else
      @comment_favorite = CommentFavorite.create!(user_id: current_user.id, comment_id: params[:id], value: 1)
      @comment.update_attributes(score: get_value(@comment), upvoted: true, downvoted: false)
    end
    render json: @comment
  end
  
  def downvote
    @comment_favorite = CommentFavorite.where(user_id: current_user.id, comment_id: params[:id])[0]
    @comment = Comment.find(params[:id])
    if @comment_favorite
      @comment_favorite.update_attributes(value: (@comment_favorite.value == -1 ? 0 : -1))
      @comment.update_attributes(score: get_value(@comment), downvoted: @comment_favorite.value == -1 ? true : false, upvoted: false)
    else
      @comment_favorite = CommentFavorite.create!(user_id: current_user.id, comment_id: params[:id], value: -1)
      @comment.update_attributes(score: get_value(@comment), downvoted: true, upvoted: false)
    end
    render json: @comment
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