class MessagesController < ApplicationController

  before_action :require_user

  def create
    @message = Message.new(message_params)
    @message.chef = current_chef
    if @message.save
      ActionCable.server.broadcast "chatroom_channel", render(partial: 'messages/message', object: @message)
      # redirect_to chat_path
    else
      redirect_to chat_path
  end
end

  private

  def message_params
    params.require(:message).permit(:content)
  end

end
