class UsersController < ApplicationController
  respond_to :html, :js

  def index

  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @product.update_attributes(user_params)
      redirect_to :back, notice: "User has been updated"
    end
  end

  def destroy

  end

  private

  def user_params
    params.require(:user).permit(
      :phone_number
    )
  end

end
