class Event < ActiveRecord::Base
  attr_accessible :category, :description, :end, :place, :score_id, :start, :title, :user_id, :created_at, :id, :updated_at


end
