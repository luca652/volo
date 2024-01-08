# app/controllers/pins_controller.rb
class PinsController < ApplicationController
  def index
    @pins = current_user.pins.includes(:resource)
  end

  # def create
  #   @resource = Resource.find(params[:resource_id])

  #   if current_user.has_pinned?(@resource)
  #     render json: { error: 'Resource already pinned' }, status: :unprocessable_entity
  #   else
  #     pin = current_user.pins.build(resource: @resource)

  #     if pin.save
  #       render json: { resource_id: @resource.id, pin_count: @resource.pin_count }, status: :created
  #     else
  #       render json: { error: pin.errors.full_messages }, status: :unprocessable_entity
  #     end
  #   end
  # end





  def destroy
    @pin = current_user.pins.find(params[:id])
    @pin.destroy
    redirect_to pins_path, notice: 'Pin removed successfully!'
  end

# trying to create a method that pins unpinned resrouces and unpins pinned ones.
  def pin_unpin
    @resource = Resource.find(params[:resource_id])

    if current_user.has_pinned?(@resource)
      @pin = current_user.pins.find_by(resource: @resource)
      @pin.destroy
    else
      @pin = Pin.new(user: current_user, resource: @resource)
      @pin.save
    end
  end
end
