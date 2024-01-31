class UsersController < ApplicationController
  def show_profile

    @user = current_user
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
