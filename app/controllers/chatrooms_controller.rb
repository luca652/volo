class ChatroomsController < ApplicationController
  def show
    @message = Message.new
    @group = Group.find(params[:id])
    @chatroom = @group.chatroom
  end
end
