class EventsController < ApplicationController

  before_action :set_event, only: [:show, :edit, :update]
  before_action :set_group, only: [:show, :edit, :update]

  def show
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
      redirect_to group_path(@group), notice: "Event was successfully updated."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to group_event_path(@group, @event), notice: "Event was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def event_params
    params.require(:event).permit(:name, :location, :category, :description, :date, :group_id, :user_id)
  end

  def set_event
    @event = Event.find(params[:id])
  end

  def set_group
    @group = @event.group
  end
end
