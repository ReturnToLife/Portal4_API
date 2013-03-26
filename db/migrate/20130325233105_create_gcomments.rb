class CreateGcomments < ActiveRecord::Migration
  def change
    create_table :gcomments do |t|
      t.integer :user_id
      t.text :body
      t.integer :gossip_id
      t.integer :score_id

      t.timestamps
    end
  end
end
