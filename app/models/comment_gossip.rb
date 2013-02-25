# == Schema Information
#
# Table name: comment_gossips
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  content    :text
#  gossip_id  :integer
#  score_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CommentGossip < ActiveRecord::Base
  attr_accessible :content, :gossip_id, :score_id, :user_id

  belongs_to :gossip
  has_one :score
  belongs_to :user
end
