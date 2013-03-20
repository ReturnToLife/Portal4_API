class AddIdToScore < ActiveRecord::Migration
  def change
    change_table(:scores) do |t|
      t.integer :article_id
      t.integer :comment_id
    end
  end
end
