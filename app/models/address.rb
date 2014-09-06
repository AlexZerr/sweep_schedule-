class Address < ActiveRecord::Base

  belongs_to :reservation

  def civil_address
    "#{street}, #{city} #{zip}"
  end

end
