# == Schema Information
#
# Table name: articles
#
#  id               :integer          not null, primary key
#  title            :string(255)
#  user_id          :integer
#  publication_date :datetime
#  thumbnail        :string(255)
#  nb_comments      :integer
#  content          :text
#  category         :string(255)
#  status           :integer
#  score_id         :integer
#  event_id         :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  group_id         :integer
#

require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
