class ResourcesController < ApplicationController
  before_action :set_resource, only: [:show, :destroy, :edit, :update]

  def index
    @resources = Resource.all
    @categories = Resource.distinct.pluck(:category)
  end

  def show

  end

  def new
    @resource = Resource.new
  end

  def create
    @resource = Resource.new(resource_params)

    if @resource.save
      redirect_to resources_path, notice: "Resource was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @resource.update(venue_params)
      redirect_to admin_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @resource.destroy
    redirect_to resources_path
  end

  private

  def resource_params
    params.require(:resource).permit(:title, :category, :comment, :picture_url, :user_id)
  end

  def set_resource
    @resource = Resource.find(params[:id])
  end
end
