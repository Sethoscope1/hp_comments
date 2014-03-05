class Article < ActiveRecord::Base
  attr_accessible :author_id, :body, :image, :title
  
  has_many :comments
  belongs_to :author, class_name: "User"
end
