class ResourcesController < ApplicationController
  def index
    @resources = Resource.all
    @categories = Resource.distinct.pluck(:category)
  end


  def show
    @resource = Resource.find(params[:id])
  end

  def pin
    @resource = Resource.includes(:pins).find(params[:id])
    
    current_user.pins.create(resource: @resource)
    # ...
  end
end
