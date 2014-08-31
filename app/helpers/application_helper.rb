module ApplicationHelper

    def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def civil_date(date_object)
    date_object.to_datetime.strftime("%A %b %d-%Y %I:%M %p")
  end

end
