class ResourcesController < ApplicationController
  def index
    @resources = Resource.all
    @categories = Resource.distinct.pluck(:category)
  end


  def show
    @resource = Resource.find(params[:id])
  end
end
