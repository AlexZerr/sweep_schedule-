class Reservation < ActiveRecord::Base

  belongs_to :user

  def parsed_date
    if params['reservation[:date_search]'].present?
      date = Date.parse(params['reservation[:date_search'])
      self.parsed_date = date.to_datetime

    end
  end
end
