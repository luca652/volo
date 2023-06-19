class UsersController < ApplicationController
  def show_profile
    @user = User.find(params[:id])
  end
end
