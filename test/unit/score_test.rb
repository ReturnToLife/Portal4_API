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

require 'test_helper'

class ScoreTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
