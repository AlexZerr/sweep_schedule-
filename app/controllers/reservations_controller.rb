class ReservationsController < ApplicationController

  respond_to :html, :js

  before_filter :find_user

  def new
    @reservation = @user.reservations.new
    @job_types = [ ["Bid", "Bid"], ["Sweep", "Sweep"] ]
  end

  def create
    @reservation = @user.reservations.new(reservation_params)
    authorize @reservation
    if @reservation.save
      redirect_to user_reservation_path(@user, @reservation), notice: "Your reservation has been created."
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end

  def reservation_params
    params.require(:reservation).permit(
      :job_type, :schedule_date, :user_id
    )
  end


end
