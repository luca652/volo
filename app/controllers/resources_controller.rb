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
  end

  def show
    # we can now access resources/show from two pages (show_profile and resources/index)
    # this stores the url of the page we are coming from so we can set proper redirects for update/destroy
    session[:previous_url] = request.referrer
  end

  def new
    @resource = Resource.new
  end

  def create
    @resource = Resource.new(resource_params)

    if @resource.save
      @pin = Pin.create!(user_id: current_user.id, resource_id: @resource.id)
      redirect_to user_path(current_user), notice: "Resource was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @resource.update(resource_params)
      redirect_to session.delete(:previous_url) || groups_path, notice: "Resource was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @resource.destroy
    redirect_to session.delete(:previous_url) || groups_path, notice: "Resource was successfully deleted."
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
