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

class Author < ActiveRecord::Base
  attr_accessible :article_id, :job, :user_id

  belongs_to :article
  belongs_to :user
end
