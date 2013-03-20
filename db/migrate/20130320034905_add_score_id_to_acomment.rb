class AddScoreIdToAcomment < ActiveRecord::Migration
  def change
    change_table(:acomments) do |t|
      t.integer :score_id
    end
  end
end
