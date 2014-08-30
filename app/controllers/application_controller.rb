class ApplicationController < ActionController::Base

  include Pundit

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :check_for_reservations_by_date


  def job_types
    @job_types ||= [ ["Bid", "Bid"], ["Sweep", "Sweep"] ]
  end

  helper_method :job_types

   def check_for_reservations_by_date
    if params[:date_search].present?
      date = Date.strptime(params[:date_search], '%m/%d/%Y')
      @reservations = Reservation.where(schedule_date: (date.beginning_of_day..date.end_of_day)).order("start_hour ASC")
    else
      @reservations = Reservation.where( schedule_date: (DateTime.now.beginning_of_day..DateTime.now.end_of_day)).order("start_hour ASC")
    end
  end 
end
