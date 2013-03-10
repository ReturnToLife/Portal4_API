class CreateAcomments < ActiveRecord::Migration
  def change
    create_table :acomments do |t|
      t.integer :user_id
      t.text :body
      t.references :article

      t.timestamps
    end
    add_index :acomments, :article_id
  end
end
