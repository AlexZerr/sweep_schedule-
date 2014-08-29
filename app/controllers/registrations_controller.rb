class RegistrationsController < Devise::RegistrationsController

  def new
    @user = User.new
    super
  end

  def create
    @user = User.new(resource_params)
    if @user.save
      redirect_to :root
    end
  end

  private

  def resource_params
    params.require(:user).permit(
      :company_name, :email, :password, :password_confirmation
    )
  end

end
