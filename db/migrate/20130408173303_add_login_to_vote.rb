class AddLoginToVote < ActiveRecord::Migration
  def change
    change_table(:votes) do |t|
      t.string :login
    end
  end
end
