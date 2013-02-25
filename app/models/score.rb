# == Schema Information
#
# Table name: scores
#
#  id         :integer          not null, primary key
#  score_pos  :integer
#  score_neg  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Score < ActiveRecord::Base
  attr_accessible :score_neg, :score_pos

  has_many :votes
end
