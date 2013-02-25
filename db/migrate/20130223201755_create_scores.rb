class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :score_pos
      t.integer :score_neg

      t.timestamps
    end
  end
end
