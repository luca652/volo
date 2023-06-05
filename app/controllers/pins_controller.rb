# app/controllers/pins_controller.rb
class PinsController < ApplicationController
  def index
    @pins = current_user.pins.includes(:resource)
  end

  def create
    @resource = Resource.find(params[:resource_id])
    current_user.pins.create(resource: @resource)
    redirect_to pins_path, notice: 'Resource pinned successfully!'
  end

  def destroy
    @pin = current_user.pins.find(params[:id])
    @pin.destroy
    redirect_to pins_path, notice: 'Pin removed successfully!'
  end
end
