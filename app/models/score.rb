# == Schema Information
#
# Table name: scores
#
#  id          :integer          not null, primary key
#  score_pos   :integer
#  score_neg   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  article_id  :integer
#  acomment_id :integer
#  gossip_id   :integer
#  gcomment_id :integer
#

class Score < ActiveRecord::Base
  attr_accessible :score_neg, :score_pos, :article_id, :acomment_id, :gossip_id, :gcomment_id

  has_many :votes
end
