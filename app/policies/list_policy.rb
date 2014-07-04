class ListPolicy < ApplicationPolicy

  def index?
    true
  end

  def create?
    user.present? && user.role?(:user)
  end

  def update?
    create?
  end

end
