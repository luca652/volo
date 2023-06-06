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
    if @booking.save
      redirect_to group_path(@group)
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :event_id)
  end
end
