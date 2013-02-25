# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  parent_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Group < ActiveRecord::Base
  attr_accessible :parent_id, :title

  has_many :jobs
  has_many :child, :class_name => "Group", :foreign_key => "parent_id"
  belongs_to :parent, :class_name => "Group"
end
