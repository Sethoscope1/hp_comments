class Article < ActiveRecord::Base
  attr_accessible :author_id, :body, :image, :title
  
  has_many :comments, dependent: :destroy;
  belongs_to :author, class_name: "User"
  
  validates :body, presence: true
end
