class UserPolicy < ApplicationPolicy

  def index?
  
  end

  def show?
    user_is_user
  end

  def edit?
    user_is_user
  end

  def update?
    user_is_user
  end

  def destroy?

  end

  private

  def user_is_user
    user && user.id == record.id
  end

end
