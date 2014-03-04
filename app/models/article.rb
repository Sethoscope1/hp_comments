class Article < ActiveRecord::Base
  attr_accessible :author_id, :body, :image, :title
end
