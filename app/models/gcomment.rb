class Gcomment < ActiveRecord::Base
  belongs_to :gossip
  attr_accessible :body, :score_id, :user_id, :id

  has_one :score
end
