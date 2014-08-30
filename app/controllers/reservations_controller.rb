class ReservationsController < ApplicationController

  respond_to :html, :js

  before_filter :find_user, except: [:index]

  def index
    @reservation = current_user.reservations.new
  end

  def new
    @reservation = @user.reservations.new
    @job_types = [ ["Sweep", "Sweep"], ["Bid", "Bid"] ]
    check_for_reservations_by_date
  end

  def create
    @reservation = @user.reservations.new(reservation_params)
    @reservation.start_hour = @reservation.schedule_date
    @reservation.end_hour = @reservation.schedule_date + params[:date][:hour].to_i.hours
    authorize @reservation
    @reservation.check_schedule_times()
    if @reservation.errors.empty?
      @reservation.save
      redirect_to user_reservation_path(@user, @reservation), notice: "Your reservation has been created."
    else
      @errors = @reservation.errors.full_messages
      redirect_to :back, notice: "#{ @errors }"
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
      :job_type, :schedule_date, :user_id, :date_search, :start_hour, :end_hour
    )
  end
  
#  def check_for_reservations_by_date
#    if params[:date_search].present?
#      date = Date.strptime(params[:date_search], '%m/%d/%Y')
#      @reservations = Reservation.where(schedule_date: (date.beginning_of_day..date.end_of_day) )
#    else
#      @reservations = Reservation.where( schedule_date: (DateTime.now.beginning_of_day..DateTime.now.end_of_day) )
#    end
#  end


end
