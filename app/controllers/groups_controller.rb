class GroupsController < ApplicationController
  def index
    @groups = Group.all
    @request = Request.new
    @booking = Booking.new
  end

  def show
    @group = Group.find(params[:id])
    @events = @group.events
  end
end
