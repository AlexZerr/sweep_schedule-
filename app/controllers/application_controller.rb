class ApplicationController < ActionController::Base

  include Pundit

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def job_types
    @job_types ||= [ ["Bid", "Bid"], ["Sweep", "Sweep"] ]
  end

  helper_method :job_types
end
