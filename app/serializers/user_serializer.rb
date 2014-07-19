class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :encrypted_password
  has_many :posts
  has_many :lists
end
