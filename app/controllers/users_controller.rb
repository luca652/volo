class UsersController < ApplicationController
  def show_profile

    @user = current_user

    # GROUPS
    # groups where user is an admin
    @groups_admin = Group.where(user_id: @user.id)

    # groups where user is a member
    @requests = Request.where(user_id: @user.id)
    @groups_member = []
    @requests.each do |request|
      if request.accepted == true
        @groups_member.push(request.group)
      end
    end

    # user's groups
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
