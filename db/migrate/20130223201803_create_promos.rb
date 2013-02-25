class CreatePromos < ActiveRecord::Migration
  def change
    create_table :promos do |t|
      t.string :title
      t.integer :school_id

      t.timestamps
    end
  end
end
