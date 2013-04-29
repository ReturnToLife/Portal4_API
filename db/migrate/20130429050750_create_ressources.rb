class CreateRessources < ActiveRecord::Migration
  def change
    create_table :ressources do |t|
      t.string :name
      t.date :borrow_date
      t.date :estimate_date
      t.integer :status
      t.integer :user_id
      t.integer :group_id
      t.text :commentary

      t.timestamps
    end
  end
end
