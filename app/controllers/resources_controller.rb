class ResourcesController < ApplicationController
  def index
    @resources = Resource.all.order(title: :asc)



  end

  def show
    @resource = Resource.find(params[:id])
  end
end
