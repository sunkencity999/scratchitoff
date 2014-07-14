class List < ActiveRecord::Base
  #this associates posts under lists, and will 
  #delete any dependent posts when a list is deleted. 
  has_many :posts, dependent: :destroy
  belongs_to :user
end
