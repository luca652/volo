class GroupsController < ApplicationController
  def index
    @groups = Group.all
    @request = Request.new
  end


end
