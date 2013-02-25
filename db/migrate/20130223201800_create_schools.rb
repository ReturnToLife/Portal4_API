class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :title

      t.timestamps
    end
  end
end
