class AddGroupIdToArticle < ActiveRecord::Migration
  def change
    change_table(:articles) do |t|
      t.integer :group_id
    end
  end
end
