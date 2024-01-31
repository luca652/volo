class UsersController < ApplicationController
  def show_profile
    # this if statement is needed because when we open the app the user should
    # be set to current_user (the new root_path is the user's profile).
    # This causes issues when clicking on other users' profiles, because in those cases
    # @user should = User.find(params[:id]), so we are checking that if the params are presente and different from current_user id
    if params[:id].present? && params[:id] != current_user.id.to_s
      @user = User.find(params[:id])
    else
      @user = current_user
    end
    # GROUPS
    # groups where user is an admin
    @groups_admin = Group.where(user_id: @user.id)
    # groups where user is a member
    @accepted_requests = Request.where(user_id: @user.id, accepted: true)
    @groups_member = Group.joins(:requests).where(requests: { id: @accepted_requests.pluck(:id) })
    # all user's groups
    @groups = @groups_admin + @groups_member

    # EVENTS
    # getting user's upcoming events from bookings
    @bookings = Booking.where(user_id: @user.id)
    @events = Event.includes(:bookings).where(bookings: { user_id: current_user.id })

    # PINS & RESOURCES
    @pins = Pin.where(user_id: @user.id)
    @resources = []
    @pins.each do |pin|
      @resources << pin.resource
    end
  end
end
