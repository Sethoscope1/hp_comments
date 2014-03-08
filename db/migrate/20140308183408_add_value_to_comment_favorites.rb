class AddValueToCommentFavorites < ActiveRecord::Migration
  def change
    add_column :comment_favorites, :value, :integer
  end
end
