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

class Job < ActiveRecord::Base
  attr_accessible :group_id, :job, :user_id

  belongs_to :user
  belongs_to :group
end
