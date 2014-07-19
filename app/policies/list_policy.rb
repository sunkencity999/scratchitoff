class ListPolicy < ApplicationPolicy

  def index?
    user.present? && user_id == list.user_id?
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
