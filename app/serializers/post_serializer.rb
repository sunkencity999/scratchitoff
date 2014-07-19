class PostSerializer < ActiveModel::Serializer
  attributes :user_id, :title, :body
  belongs_to :user, :list
end
