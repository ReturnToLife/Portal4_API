class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.integer :user_id
      t.integer :group_id
      t.string :job

      t.timestamps
    end
  end
end
