class BookingsController < ApplicationController

  def create
    @group = Group.find(params[:group_id])
    @event = Event.find(params[:event_id])
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to group_path(@group)
    end
  end

  def destroy
    @group = Group.find(params[:group_id])
    @event = Event.find(params[:event_id])
    @booking = Booking.find_by(event: @event, user: current_user)
    @booking.destroy
    if request.path == group_path(@group)
      redirect_to group_path(@group)
    else
      redirect_to user_path(current_user, anchor: "events-content")
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :event_id)
  end
end
