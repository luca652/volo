class UsersController < ApplicationController
  def show_profile

    @user = User.find(params[:id])
    # groups where user is an admin
    @groups_admin = Group.where(user_id: @user.id)

    # groups where user is a member / request is pending / request has been declined
    @requests = Request.where(user_id: @user.id)
    @groups_member = []
    # @groups_pending = []
    # @groups_declined = []
    @requests.each do |request|
      if request.accepted == true
        @groups_member.push(request.group)
      # elsif request.declined == true
      #   @groups_declined.push(request.group)
      # else
      #   @groups_pending.push(request.group)
      end
    end

    @groups = @groups_admin + @groups_member

    # getting user's upcoming events from bookings
    @bookings = Booking.where(user_id: @user.id)
    @my_events = []
    @bookings.each do |booking|
      @my_events.push(booking.event)
    end

    @my_pins = Pin.where(user_id: @user.id)
  end
end
