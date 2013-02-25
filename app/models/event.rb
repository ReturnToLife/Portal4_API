# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  date       :datetime
#  user_id    :integer
#  score_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Event < ActiveRecord::Base
  attr_accessible :date, :score_id, :user_id


  has_one :score
  belongs_to :user
end
