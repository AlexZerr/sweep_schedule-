class Addresses < ApplicationController
  
  def new
    @user = current_user
    @reservation = @user.reservations.find(params[:reservation_id])
    @address = @reservation.address.new

  end

  def create
    @address = @reservation.address.new(address_params)
  end

  private

  def address_params
    params.require(:address).permit(
      :street, :city, :state, :zip, :instructions
    )
  end
end
