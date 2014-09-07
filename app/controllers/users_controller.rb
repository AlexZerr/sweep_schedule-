class UsersController < ApplicationController
  respond_to :html, :js

  def index

  end

  def show
    @user = User.find(params[:id])
  end

  def update

  end

  def destroy

  end
end
