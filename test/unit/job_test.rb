# == Schema Information
#
# Table name: jobs
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  group_id   :integer
#  job        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class JobTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
