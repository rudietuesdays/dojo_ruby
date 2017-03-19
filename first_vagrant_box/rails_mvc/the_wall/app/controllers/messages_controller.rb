class MessagesController < ApplicationController
  def index
    @user = User.find(session[:id])
    @messages = Message.includes(:user)
  end

  def create
    @user = User.find(session[:id])
    @message = @user.messages.new(message_params)
    if @message.save #if message can be saved, redirect
      redirect_to messages_path
    else #if message can't be saved, redirect with errors
      flash[:errors] = @message.errors.full_messages
      redirect_to :back
    end
  end

  private
  def message_params
    params.require(:message).permit(:content)
  end
end
