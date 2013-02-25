class CreateGossips < ActiveRecord::Migration
  def change
    create_table :gossips do |t|
      t.string :text
      t.integer :score_id
      t.integer :user_id

      t.timestamps
    end
  end
end
