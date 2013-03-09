class Acomment < ActiveRecord::Base
  belongs_to :article
  attr_accessible :body, :user
end
