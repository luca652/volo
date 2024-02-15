# app/controllers/pins_controller.rb
class PinsController < ApplicationController
  def index
    @pins = current_user.pins.includes(:resource)
  end

  def destroy
    @pin = current_user.pins.find(params[:id])
    @pin.destroy
    redirect_to pins_path, notice: 'Pin removed successfully!'
  end

  def pin_unpin
    @resource = Resource.find(params[:resource_id])

    if current_user.has_pinned?(@resource)
      @pin = current_user.pins.find_by(resource: @resource)
      @pin.destroy
      redirect_back fallback_location: resources_path
    else
      @pin = Pin.new(user: current_user, resource: @resource)
      if @pin.save
        redirect_back fallback_location: resources_path
      else
        render json: { error: pin.errors.full_messages }, status: :unprocessable_entity
      end
    end
  end
end
