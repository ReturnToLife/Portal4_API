# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  parent_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  commentary :text
#  contact    :text
#

class Group < ActiveRecord::Base
  attr_accessible :parent_id, :title, :created_at, :updated_at, :commentary, :contact

  has_many :jobs
  has_many :ressources
  has_many :articles
  has_many :child, :class_name => "Group", :foreign_key => "parent_id"
  belongs_to :parent, :class_name => "Group"
end
