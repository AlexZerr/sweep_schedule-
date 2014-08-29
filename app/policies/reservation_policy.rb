class ReservationPolicy < ApplicationPolicy

  def index?
    user_owns_resource
  end

  def new?
    user
  end

  def create?
    user
  end

  def show?
    user_owns_resource
  end

  def edit?
    user_owns_resource
  end
  
  def update?
    user_owns_resource
  end

  def destroy?
    user_owns_resource
  end

  private

  def user_owns_resource
    user && user == record.user
  end

end
