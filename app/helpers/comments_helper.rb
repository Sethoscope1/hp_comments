module CommentsHelper
  
  def nested_comments(comments)
    comments.map do |comment, sub_comments|
      render(comment) + content_tag(:div, nested_comments(sub_comments), :class => "nested_comment")
    end.join.html_safe
  end
  
  def get_value(comment)
    CommentFavorite.where(comment_id: comment.id).map { |comment_fav| comment_fav.value.to_i }.sum
  end
end
