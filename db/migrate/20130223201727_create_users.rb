class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login
      t.string :firstname
      t.string :lastname
      t.integer :promo_id
      t.integer :school_id
      t.string :city
      t.string :photo_url
      t.string :avatar_url
      t.integer :uid
      t.string :report_url
      t.string :email

      t.timestamps
    end
  end
end
