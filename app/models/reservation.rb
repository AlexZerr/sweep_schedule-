class Reservation < ActiveRecord::Base
  
  after_create :send_reservation_email

  belongs_to :user

  def display_date
    "#{schedule_date.month}/#{schedule_date.day}/#{schedule_date.year}"
  end

  def schedule_date_start_hour
    schedule_date.to_datetime.strftime("%m/%d/%Y %I:%M %p")
  end

  def start_time
    start_hour.strftime("%I %p")
  end

   def end_time
    end_hour.strftime("%I %p")
   end


  def check_schedule_times
    res = Reservation.where(schedule_date: schedule_date.beginning_of_day..schedule_date.end_of_day)
    res.each do |r|
      if start_hour.hour.in?( (r.start_hour.hour)..(r.end_hour.hour) )
        errors[:base] << "This time has been taken"
      end
    end
  end

  def res_month
    schedule_date.month
  end

  private

  def send_reservation_email
    ReservationMailer.send_reservation_notice(id).deliver
  end

end
