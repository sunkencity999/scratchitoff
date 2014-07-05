class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :list

  default_scope { order('created_at DESC')}

    validates :title, length: { minimum: 5}, presence: true
    validates :body, length: { minimum: 20}, presence: true
    validates :list, presence: true
    validates :user, presence: true
end
