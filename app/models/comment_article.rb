# == Schema Information
#
# Table name: comment_articles
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  content    :text
#  article_id :integer
#  score_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CommentArticle < ActiveRecord::Base
  attr_accessible :article_id, :content, :score_id, :user_id

  belongs_to :article
  has_one :score
  belongs_to :user
end
