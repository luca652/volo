class RequestsController < ApplicationController
  def create
    @group = Group.find(params[:group_id])
    @request = Request.new(request_params)
    if @request.save
      redirect_to groups_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def accepted
    @group = Group.find(params[:group_id])
    @request = Request.find(params[:request_id])
    @request.group = @group
    @request.accepted = true
    @request.save
    redirect_to profile_path(current_user)
  end

  def declined
    @group = Group.find(params[:group_id])
    @request = Request.find(params[:request_id])
    @request.group = @group
    @request.declined = true
    @request.save
    redirect_to profile_path(current_user)
  end

  private

  def request_params
    params.require(:request).permit(:user_id, :group_id)
  end
end
