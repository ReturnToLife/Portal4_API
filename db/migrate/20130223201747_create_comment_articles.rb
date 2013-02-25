class CreateCommentArticles < ActiveRecord::Migration
  def change
    create_table :comment_articles do |t|
      t.integer :user_id
      t.text :content
      t.integer :article_id
      t.integer :score_id

      t.timestamps
    end
  end
end
