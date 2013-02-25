# == Schema Information
#
# Table name: schools
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class School < ActiveRecord::Base
  attr_accessible :title

  has_many :promos
  has_many :users
end
