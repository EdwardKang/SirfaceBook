module MessagesHelper
  def in_conversation
    message = Message.find(params[:id])
    redirect_to :back unless current_user.id == message.sender_id || current_user.id == message.receiver_id
  end
end
