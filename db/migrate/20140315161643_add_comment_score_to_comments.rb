class AddCommentScoreToComments < ActiveRecord::Migration
  def change
    add_column :comments, :score, :integer
  end
end
