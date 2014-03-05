class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :article_id
      t.text :body

      t.timestamps
    end
    add_index :comments, :article_id
    add_index :comments, :user_id
  end
end

