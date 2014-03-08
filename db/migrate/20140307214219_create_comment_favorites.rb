class CreateCommentFavorites < ActiveRecord::Migration
  def change
    create_table :comment_favorites do |t|
      t.integer :user_id
      t.integer :comment_id

      t.timestamps
    end
    add_index :comment_favorites, :user_id
    add_index :comment_favorites, :comment_id
  end
end
