class PostSerializer < ActiveModel::Serializer
  attributes :user_id, :title, :body
  
end
