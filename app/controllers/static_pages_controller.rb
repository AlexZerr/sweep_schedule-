class StaticPagesController < ApplicationController

  before_filter :set_new_reservation

  def home
  end

  def trucks
  end

  def about
  end

  private

  def set_new_reservation
    if current_user
      @reservation = current_user.reservations.new 
    end
  end

end
