class RequestsController < ApplicationController
  def create
    @group = Group.find(params[:group_id])
    @request = Request.new(request_params)
    if @request.save
      redirect_to groups_path, status: :created
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def request_params
    params.require(:request).permit(:user_id, :group_id)
  end
end
