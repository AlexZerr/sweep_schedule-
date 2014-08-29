class StaticPagesController < ApplicationController

  def home
    @user = current_user
    @reservation = @user.reservations.new if @user
  end

  def trucks
    @user = current_user
    @reservation = @user.reservations.new if @user
  end

  def about
    @user = current_user
    @reservation = @user.reservations.new if @user
  end

end
