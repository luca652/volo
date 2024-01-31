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
    redirect_to group_path(@group)
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :event_id)
  end
end
