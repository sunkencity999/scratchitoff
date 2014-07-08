class PostPolicy < ApplicationPolicy

  def index?
    false #this to restrict lists and posts to the User who made them
  end

  def create?
    user.present?
  end

  def update?
    create?
  end
  
  def destroy?
    create?
  end
  
end
