class RegistrationsController < Devise::RegistrationsController

  def new
    @user = User.new
    super
  end

  def create
    @user = User.new(resource_params)
    if @user.save
      sign_in @user
      redirect_to new_user_reservation_path(@user), notice: "Thank you for signing up."
    end
  end

  private

  def resource_params
    params.require(:user).permit(
      :company_name, :email, :password, :password_confirmation
    )
  end

end
