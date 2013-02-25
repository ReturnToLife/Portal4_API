# == Schema Information
#
# Table name: comment_events
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  content    :text
#  event_id   :integer
#  score_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class CommentEventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
