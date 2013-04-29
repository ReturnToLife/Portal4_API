class Ressource < ActiveRecord::Base
  attr_accessible :borrow_date, :commentary, :estimate_date, :group_id, :name, :status, :user_id, :created_at, :updated_at, :id
end
