class EventsController < ApplicationController

  before_action :set_event_and_group, only: [:show, :edit, :update, :destroy]

  def show
    session[:previous_url] = request.referrer
  end

  def new
    @group = Group.find(params[:group_id])
    @event = Event.new
  end

  def create
    @group = Group.find(params[:group_id])
    @event = Event.new(event_params)
    @event.group = @group

    if @event.save
      @booking = Booking.create(event_id: @event.id, user_id: current_user.id)
      redirect_to group_path(@group), notice: "Event was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to session.delete(:previous_url) || root_path, notice: "Event was successfully updated."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookings = @event.bookings
    @bookings.destroy_all
    @event.destroy
    redirect_to session.delete(:previous_url) || root_path, notice: "Event was successfully deleted."
  end

  private

  def event_params
    params.require(:event).permit(:name, :location, :category, :description, :date, :group_id, :user_id)
  end

  def set_event_and_group
    @event = Event.find(params[:id])
    @group = @event.group
  end
end
