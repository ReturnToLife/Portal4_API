class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :category
      t.integer :user_id
      t.integer :score_id
      t.string :title
      t.text :description
      t.string :place
      t.datetime :start
      t.datetime :end

      t.timestamps
    end
  end
end
