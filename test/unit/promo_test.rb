# == Schema Information
#
# Table name: promos
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  school_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class PromoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
