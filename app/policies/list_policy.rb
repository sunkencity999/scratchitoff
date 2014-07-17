class ListPolicy < ApplicationPolicy

  def index?
    user.present? && current.user == user?
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
