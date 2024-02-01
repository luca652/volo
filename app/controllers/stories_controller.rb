class StoriesController < ApplicationController

  def new
    @prompt = Prompt.new
    @user = current_user
    @prompt.user = @user
  end

  def show
    @story = Story.find(params[:id])
  end
end
