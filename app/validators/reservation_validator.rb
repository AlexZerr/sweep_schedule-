class ReservationValidator < ActiveModel::Validator

  def validate(record)
    res = Reservation.all
    if res.map{|e| (e.start_hour.to_datetime..e.end_hour.to_datetime).include?(record.start_hour)} == true
      errors[:name] << "This Time has been taken"
    end
  end
end
