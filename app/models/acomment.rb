class Acomment < ActiveRecord::Base
  belongs_to :article
  attr_accessible :id, :body, :user_id
end
