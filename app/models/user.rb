# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  login                  :string(255)
#  firstname              :string(255)
#  lastname               :string(255)
#  promo_id               :integer
#  school_id              :integer
#  city                   :string(255)
#  photo_url              :string(255)
#  avatar_url             :string(255)
#  uid                    :integer
#  report_url             :string(255)
#  email                  :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  authentication_token   :string(255)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :avatar_url, :city, :email, :firstname, :lastname, :login, :photo_url, :promo_id, :report_url, :school_id, :uid


  belongs_to :school
  belongs_to :promo
  has_many :jobs
  has_many :authors
  has_many :articles
  has_many :events
  has_many :gossips
  has_many :comment_articles
  has_many :comment_gossip
  has_many :comment_event
  has_many :votes
end
