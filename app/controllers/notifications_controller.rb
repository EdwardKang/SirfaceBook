class NotificationsController < ApplicationController
  def destroy
    @notification = Notification.find(params[:id])
    @notification.destroy
    
    if request.xhr?
      render partial: "layouts/empty"
    else
      redirect_to :back
    end
  end
end
