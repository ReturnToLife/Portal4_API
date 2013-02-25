class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.integer :article_id
      t.integer :user_id
      t.string :job

      t.timestamps
    end
  end
end
