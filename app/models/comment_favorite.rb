class CommentFavorite < ActiveRecord::Base
  attr_accessible :comment_id, :user_id, :article_id, :value
  
  validates :user_id, uniqueness: {scope: :comment_id}
  
  belongs_to :comment
  belongs_to :user
end
