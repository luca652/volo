class ResourcesController < ApplicationController
  def index
    @resources = Resource.all
    @categories = Resource.distinct.pluck(:category)
  end

  def show
    @resource = Resource.find(params[:id])
  end

  def new
    @resource = Resource.new
  end

  def create
    @resource = Resource.new(resource_params)

    if @resource.save
      redirect_to resources_path, notice: "Resource was successfully created."
    else
      render :new
    end
  end

  private

  def resource_params
    params.require(:resource).permit(:title, :category, :comment, :picture_url, :user_id)
  end
end
