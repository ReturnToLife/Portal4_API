# == Schema Information
#
# Table name: authors
#
#  id         :integer          not null, primary key
#  article_id :integer
#  user_id    :integer
#  job        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class AuthorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
