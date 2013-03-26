# == Schema Information
#
# Table name: gossips
#
#  id         :integer          not null, primary key
#  text       :string(255)
#  score_id   :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Gossip < ActiveRecord::Base
  attr_accessible :score_id, :text, :user_id, :created_at, :updated_at, :id

  has_many :gcomments, :dependent => :destroy
  belongs_to :user
  has_one :score
end
