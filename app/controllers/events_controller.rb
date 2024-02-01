class EventsController < ApplicationController

  def show
  end

  def new
    @group = Group.find(params[group_id:])
    @event = Event.new
    @group = @event.group
  end

  def new_group_event
    @event = Event.new
    @groups = current_user.groups
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
