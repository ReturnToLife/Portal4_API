# == Schema Information
#
# Table name: acomments
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  body       :text
#  article_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class AcommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
