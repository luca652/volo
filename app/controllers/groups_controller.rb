class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :destroy, :edit, :update]

  def index
    @groups = Group.all
    @request = Request.new
    @markers = @groups.geocoded.map do |group|
      {
        lat: group.latitude,
        lng: group.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {group: group}),
        marker_html: render_to_string(partial: "marker")
      }
    end
  end

  def show
    @admin = @group.user
    # REQUESTS & MEMBERS
    @requests = Request.where(group_id: @group.id, accepted: false, declined: false)
    @members = @group.users.joins(:requests).where(requests: { accepted: true }).uniq
    # EVENTS AND EVENT BOOKINGS (RSVPs)
    @events = @group.events
    @booking = Booking.new

    @chatroom = @group.id
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @chatroom = Chatroom.new
    @group.chatroom = @chatroom

    if @group.save && @chatroom.save
      redirect_to user_path(current_user), notice: "The group was successfully created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to group_path(@group), notice: "Group was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @group.destroy
    redirect_to user_path(current_user), notice: "Group was successfully destroyed."
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name, :location, :description, :picture_url, :user_id, :language, :children_age)
  end
end
