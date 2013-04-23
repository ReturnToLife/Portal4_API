# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  category    :string(255)
#  user_id     :integer
#  score_id    :integer
#  title       :string(255)
#  description :text
#  place       :string(255)
#  start       :date
#  end         :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Event < ActiveRecord::Base
  attr_accessible :category, :description, :end, :place, :score_id, :start, :title, :user_id, :created_at, :id, :updated_at


end
