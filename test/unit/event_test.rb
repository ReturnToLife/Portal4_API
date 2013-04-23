# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  category    :string(255)
#  user_id     :integer
#  score_id    :integer
#  title       :string(255)
#  description :text
#  place       :string(255)
#  start       :date
#  end         :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
