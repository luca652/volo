class GroupsController < ApplicationController
  def index
    @groups = Group.all
    @request = Request.new
    @markers = @groups.geocoded.map do |group|
      {
        lat: group.latitude,
        lng: group.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {groups: group})
      }
    end
  end

  def show
    @group = Group.find(params[:id])
    @events = @group.events
    @booking = Booking.new
    @chatroom = @group.id
  end

  def create_booking
    @group = Group.find(params[:group_id])
    @event = Event.find(params[:event_id])
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to group_path(@group)
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

  private

  def booking_params
    params.require(:booking).permit(:user_id, :event_id)
  end
end
