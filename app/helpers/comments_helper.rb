module CommentsHelper
  
  def nested_comments(comments)
    comments.map do |comment, sub_comments|
      render(comment) + content_tag(:div, nested_comments(sub_comments), :class => "nested_comment")
    end.join.html_safe
  end
  
  def get_value(comment)
    CommentFavorite.where(comment_id: comment.id).map { |comment_fav| comment_fav.value.to_i }.sum
  end
  
  def upvoted?(comment)
    favorite = CommentFavorite.where(user_id: current_user.id, comment_id: comment.id)[0]
    return false if favorite.nil? || favorite.value != 1
    
    true
  end
  
  def downvoted?(comment)
    favorite = CommentFavorite.where(user_id: current_user.id, comment_id: comment.id)[0]
    return false if favorite.nil? || favorite.value != -1
    
    true
  end
  
  def format_params(params)
    formatted_params = {}
    formatted_params[:body] = params[:body]
    formatted_params[:article_id] = params[:articleId]
    formatted_params[:user_id] = current_user.id
    
    formatted_params
  end
end
