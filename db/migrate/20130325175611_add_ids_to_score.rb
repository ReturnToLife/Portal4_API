class AddIdsToScore < ActiveRecord::Migration
  def change
    change_table(:scores) do |t|
      t.integer :gossip_id
      t.integer :gcomment_id
    end
  end
end
