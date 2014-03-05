class Comment < ActiveRecord::Base
  attr_accessible :user_id, :body, :article_id, :parent_id
  
  has_ancestry

  belongs_to :user
  belongs_to :article
  belongs_to :comment
  
  validates :article_id, presence: true
  validates :user_id, presence: true
  validates :body, presence: true
end