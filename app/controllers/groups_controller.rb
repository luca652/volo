class FilterForm
  include ActiveModel::Model

  attr_accessor :language
  attr_accessor :childrens_age

  def childrens_age=(value)
    @childrens_age = value.reject(&:blank?)
  end

  def apply_filters(groups)
    groups = groups.where(language: language) if language.present?
    groups = groups.where("childrens_age && ARRAY[?]::varchar[]") if childrens_age.present?
    groups
  end
end

class GroupsController < ApplicationController
  def index
    @filter_form = FilterForm.new(filter_form_params)
    @groups = Group.all
    @groups = @filter_form.apply_filters(@groups) if @filter_form.valid?
    @request = Request.new
    @markers = @groups.geocoded.map do |group|
      {
        lat: group.latitude,
        lng: group.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {group: group})
      }
    end
  end

  def show
    @group = Group.find(params[:id])
    @events = @group.events
    @booking = Booking.new
    @chatroom = @group.id
    @members = @group.users
    @requests = Request.where(group_id: @group.id)
  end

  def create_booking
    @group = Group.find(params[:group_id])
    @event = Event.find(params[:event_id])
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to group_path(@group)
    end
  end

  private

  def filter_form_params
    params.require(:filter_form).permit(:language, childrens_age: [])
  end

  def booking_params
    params.require(:booking).permit(:user_id, :event_id)
  end
end
