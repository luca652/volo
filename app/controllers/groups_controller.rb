class GroupsController < ApplicationController
  def index
    @groups = Group.all
    @request = Request.new
    @markers = @groups.geocoded.map do |group|
      {
        lat: group.latitude,
        lng: group.longitude
      }
    end
  end

  def show
    @group = Group.find(params[:id])
    @events = @group.events
    @booking = Booking.new
  end

  def create_booking
    @group = Group.find(params[:group_id])
    @event = Event.find(params[:event_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.event = @event
    @booking.event.group = @group
    if @booking.save
      redirect_to groups_path, status: :created
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :event_id)
  end
end
