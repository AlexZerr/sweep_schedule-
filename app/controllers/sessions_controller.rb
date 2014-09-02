class SessionsController < Devise::SessionsController

  def new
    super
  end

  def after_sign_in_path_for(resource)
    new_user_reservation_path(resource)
  end
end
