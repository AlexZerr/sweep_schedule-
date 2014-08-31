class ReservationMailer < ActionMailer::Base
  default from: "reservations@sweepalotsweeping.com"

  def send_reservation_notice(reservation_id)
    @reservation = Reservation.find(reservation_id)
    mail(to: "andrewbosman@msn.com, thwarts@gmail.com", subject: "New Sweeping Reservation")
  end
end
