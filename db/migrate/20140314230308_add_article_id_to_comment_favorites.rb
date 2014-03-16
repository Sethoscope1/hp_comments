class AddArticleIdToCommentFavorites < ActiveRecord::Migration
  def change
    add_column :comment_favorites, :article_id, :integer
  end
end
