class FilterForm
  include ActiveModel::Model

  attr_accessor :category

  def apply_filters(resources)
    resources = resources.where(category: category) if category.present?
    resources
  end
end

class ResourcesController < ApplicationController
  before_action :set_resource, only: [:show, :destroy, :edit, :update]

  def index
    @filter_form = FilterForm.new(filter_form_params)
    @resources = Resource.order(created_at: :desc).all
    @resources = @filter_form.apply_filters(@resources) if @filter_form.valid?
    # @categories = Resource.distinct.pluck(:category)
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
    if @resource.update(resource_params)
      redirect_to resources_path
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

  def filter_form_params
    params.permit(filter_form: [:category])[:filter_form]
  end
end
