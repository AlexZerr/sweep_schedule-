class Reservation < ActiveRecord::Base

  belongs_to :user

  def display_date
    "#{schedule_date.month}/#{schedule_date.day}/#{schedule_date.year}"
  end

  def schedule_date_start_hour
    schedule_date.hour
  end

  def start_time
    start_hour.strftime("%I %p")
  end

   def end_time
    end_hour.strftime("%I %p")
   end


  private

end
