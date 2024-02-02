class EventsController < ApplicationController

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
      redirect_to group_path(@group), notice: "Event was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def event_params
    params.require(:event).permit(:name, :location, :category, :description, :date, :group_id, :user_id)
  end
end
