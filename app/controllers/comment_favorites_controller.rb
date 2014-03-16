class CommentFavoritesController < ApplicationController
  
  def index 
    @comment_favorites = CommentFavorite.all
    
    render json: @comment_favorites
  end
end
