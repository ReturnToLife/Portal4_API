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

class Acomment < ActiveRecord::Base
  belongs_to :article
  attr_accessible :id, :body, :user_id
end
