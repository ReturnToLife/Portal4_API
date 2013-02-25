class CreateCommentEvents < ActiveRecord::Migration
  def change
    create_table :comment_events do |t|
      t.integer :user_id
      t.text :content
      t.integer :event_id
      t.integer :score_id

      t.timestamps
    end
  end
end
