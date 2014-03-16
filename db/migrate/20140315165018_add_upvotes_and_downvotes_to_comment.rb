class AddUpvotesAndDownvotesToComment < ActiveRecord::Migration
  def change
    add_column :comments, :upvoted, :boolean
    add_column :comments, :downvoted, :boolean
  end
end
