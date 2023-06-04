class BookingsController < ApplicationController
  def create
    @group = Group.find(params[:id])

    @booking = Booking.new(boooking_params)
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
