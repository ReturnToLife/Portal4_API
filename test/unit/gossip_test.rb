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

require 'test_helper'

class GossipTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
