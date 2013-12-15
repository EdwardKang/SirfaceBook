class MessagesController < ApplicationController
  include MessagesHelper
  
  before_filter :in_conversation, only: [:show]
  
  def index
    @messages = Message.where("sender_id = ? OR receiver_id = ?", current_user.id, current_user.id).where(parent_id: nil)
  end
  
  def show
    @message = Message.find(params[:id])
  end
  
  def create
    @message = Message.new(params[:message])
    @message.save
    if @message.parent_id == nil
      redirect_to @message
    else
      redirect_to message_url(@message.parent_id)
    end
  end
end
