# app/controllers/pins_controller.rb
class PinsController < ApplicationController
  def index
    @pins = current_user.pins.includes(:resource)
  end

  def create
    @resource = Resource.find(params[:resource_id])

  if current_user.has_pinned?(@resource)
    @resource.decrement!(:pin_count) # Decrement the pin count
    current_user.pins.where(resource: @resource).destroy_all # Unpin the resource
    render json: { message: 'Resource unpinned successfully', pin_count: @resource.pin_count }
  else
    @resource.increment!(:pin_count) # Increment the pin count
    current_user.pins.create(resource: @resource) # Pin the resource
    render json: { message: 'Resource pinned successfully', pin_count: @resource.pin_count }
  end
end

  def destroy
    @pin = current_user.pins.find(params[:id])
    @pin.destroy
    redirect_to pins_path, notice: 'Pin removed successfully!'
  end
end
