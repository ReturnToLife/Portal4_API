class AddGroupIdToGossip < ActiveRecord::Migration
  def change
    change_table(:gossips) do |t|
      t.integer :group_id
    end
  end
end
