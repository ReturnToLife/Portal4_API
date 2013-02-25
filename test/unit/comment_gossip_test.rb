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

require 'test_helper'

class CommentGossipTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
