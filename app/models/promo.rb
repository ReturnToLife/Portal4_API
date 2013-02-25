# == Schema Information
#
# Table name: promos
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  school_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Promo < ActiveRecord::Base
  attr_accessible :school_id, :title

  belongs_to :school
  has_many :users
end
