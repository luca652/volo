class GroupsController < ApplicationController
  def index
    @groups = Group.all
    @request = Request.new
    @markers = @groups.geocoded.map do |group|
      {
        lat: group.latitude,
        lng: group.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {groups: group})
      }
    end
  end

  def show
    @group = Group.find(params[:id])
    @events = @group.events
  end

end
