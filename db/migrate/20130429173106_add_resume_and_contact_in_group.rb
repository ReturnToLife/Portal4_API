class AddResumeAndContactInGroup < ActiveRecord::Migration
  def up
    change_table(:groups) do |t|
      t.text :commentary
      t.text :contact
    end
  end

  def down
  end
end
