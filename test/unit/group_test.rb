# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  parent_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  commentary :text
#  contact    :text
#

require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
