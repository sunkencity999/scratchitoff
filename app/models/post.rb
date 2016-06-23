class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :list

  #use this to associate with rake task in schedule.rb to automate
  #destruction of completed posts.

  scope :completed, -> { where(completed: true) }


  default_scope { order('created_at DESC')}

  #this scope used to associate ":old" with Post, and enable rake automation
  #in config/schedule.rb and destroy old posts after a week's time.

  scope :old, -> { where(["created_at >= ?", 7.days]) }


    validates :title, length: { minimum: 1}, presence: true

    validates :list, presence: true
    validates :user, presence: true
end
