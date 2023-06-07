class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def profile
    @user = current_user
    @groups_admin = Group.where(user_id: @user.id)

    @requests = Request.where(user_id: @user.id)
    @groups_member = []
    @requests.each do |request|
      @groups_member.push(request.group)
    end

    @bookings = Booking.where(user_id: @user.id)
    @my_events = []
    @bookings.each do |booking|
      @my_events.push(booking.event)
    end
  end
end
