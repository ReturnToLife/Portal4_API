# == Schema Information
#
# Table name: votes
#
#  id         :integer          not null, primary key
#  score_id   :integer
#  user_id    :integer
#  value      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  login      :string(255)
#

class Vote < ActiveRecord::Base
  attr_accessible :score_id, :user_id, :value, :login

  belongs_to :user
  belongs_to :score
end
