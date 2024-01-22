class FilterForm
  include ActiveModel::Model

  attr_accessor :children_age

  def apply_filters(groups)
    groups = groups.where(children_age: children_age) if children_age.present?
    groups
  end
end

class GroupsController < ApplicationController
  def index
    @filter_form = FilterForm.new(filter_form_params)
    @groups = Group.all
    @groups= @filter_form.apply_filters(@groups) if @filter_form.valid?
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
    @group = Group.find(params[:id])
    @admin = @group.user
    # REQUESTS & MEMBERS
    @requests = Request.where(group_id: @group.id)
    @members = @group.users.joins(:requests).where(requests: { accepted: true }).uniq
    # EVENTS AND EVENT BOOKINGS (RSVPs)
    @events = @group.events
    @booking = Booking.new

    @chatroom = @group.id
  end

  private

  def filter_form_params
    params.permit(filter_form: [:children_age])[:filter_form]
  end

end
