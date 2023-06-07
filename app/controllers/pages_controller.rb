class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def profile
    @user = current_user
    @my_groups = Group.where(user_id: @user.id)
    @requests = Request.where(user_id: @user.id)

    @groups = []
    @requests.each do |request|
      @groups.push(request.group)
    end
  end
end
