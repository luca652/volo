class RequestsController < ApplicationController
  def create
    @request = Request.new
    # @group = Group.find(params[:id])
  end
end
