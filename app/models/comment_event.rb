# == Schema Information
#
# Table name: comment_events
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  content    :text
#  event_id   :integer
#  score_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CommentEvent < ActiveRecord::Base
  attr_accessible :content, :event_id, :score_id, :user_id

  belongs_to :event
  has_one :score
  belongs_to :userend
end
