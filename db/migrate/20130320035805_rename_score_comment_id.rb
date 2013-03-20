class RenameScoreCommentId < ActiveRecord::Migration
  def up
    rename_column :scores, :comment_id, :acomment_id
  end

  def down
  end
end
