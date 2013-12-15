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
    redirect_to :back
  end
end
