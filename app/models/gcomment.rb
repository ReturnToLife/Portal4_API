# == Schema Information
#
# Table name: gcomments
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  body       :text
#  gossip_id  :integer
#  score_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Gcomment < ActiveRecord::Base
  belongs_to :gossip
  attr_accessible :body, :score_id, :user_id, :id

  has_one :score
end
