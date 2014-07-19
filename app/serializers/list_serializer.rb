class ListSerializer < ActiveModel::Serializer
  attributes :user_id, :name, :description
  has_many :posts
   
end
