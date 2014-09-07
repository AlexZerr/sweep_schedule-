class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :reservations

  def past_reservations
    reservations.where(schedule_date: 2.months.ago..DateTime.now ).order('schedule_date ASC').limit(8)
  end

  def upcoming_reservations
    reservations.where(schedule_date: DateTime.now..2.months.from_now).order('schedule_date ASC').limit(5)
  end

end
