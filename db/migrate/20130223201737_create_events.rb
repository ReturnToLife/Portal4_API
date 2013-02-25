class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.datetime :date
      t.integer :user_id
      t.integer :score_id

      t.timestamps
    end
  end
end
