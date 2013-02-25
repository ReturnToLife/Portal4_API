class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.integer :user_id
      t.datetime :publication_date
      t.string :thumbnail
      t.integer :nb_comments
      t.text :content
      t.string :category
      t.integer :status
      t.integer :score_id
      t.integer :event_id

      t.timestamps
    end
  end
end
