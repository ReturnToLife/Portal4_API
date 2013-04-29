# == Schema Information
#
# Table name: ressources
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  borrow_date   :date
#  estimate_date :date
#  status        :integer
#  user_id       :integer
#  group_id      :integer
#  commentary    :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class RessourceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
