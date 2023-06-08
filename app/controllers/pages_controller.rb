class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def profile
    @user = current_user
    # groups where user is an admin
    @groups_admin = Group.where(user_id: @user.id)

    # groups where user is a member / request is pending / request has been declined
    @requests = Request.where(user_id: @user.id)
    @groups_member = []
    @groups_pending = []
    @groups_declined = []
    @requests.each do |request|
      if request.accepted == true
        @groups_member.push(request.group)
      elsif request.declined == true
        @groups_declined.push(request.group)
      else
        @groups_pending.push(request.group)
      end
    end

    @bookings = Booking.where(user_id: @user.id)
    @my_events = []
    @bookings.each do |booking|
      @my_events.push(booking.event)
    end
  end

  def accepted
    @group = Group.find(params[:group_id])
    @request = Request.find(params[:request_id])
    @request.group = @group
    @request.accepted = true
    @request.save
    # redirect_to my_mopeds_path(current_user)
  end

  def declined
    @group = Group.find(params[:group_id])
    @request = Request.find(params[:request_id])
    @request.group = @group
    @request.declined = true
    @request.save
    # redirect_to my_mopeds_path(current_user)
  end
end
