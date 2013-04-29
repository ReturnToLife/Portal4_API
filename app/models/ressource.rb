# == Schema Information
#
# Table name: ressources
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  borrow_date   :date
#  estimate_date :date
#  status        :integer
#  user_id       :integer
#  group_id      :integer
#  commentary    :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Ressource < ActiveRecord::Base
  attr_accessible :borrow_date, :commentary, :estimate_date, :group_id, :name, :status, :user_id, :created_at, :updated_at, :id

  belongs_to :group
end
