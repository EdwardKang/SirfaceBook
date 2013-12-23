class FriendshipsController < ApplicationController
  before_filter :require_user!

  def create
    @friendship = Friendship.new(params[:friendship])
    @friendship.is_pending = true
    @friendship.save
    
    if request.xhr?
      render partial: "layouts/delete_friendship", locals: { label: "Cancel Request", friendship:  @friendship }
    else
      redirect_to :back
    end
  end

  def update
    @friendship = Friendship.find_by_friender_id_and_friendee_id(
      params[:friendship][:friender_id], params[:friendship][:friendee_id]
    )

    params[:friendship][:is_pending] = false
    @friendship.update_attributes(params[:friendship])
    
    if request.xhr?
      render partial: "layouts/delete_friendship", locals: { label: "Unfriend", friendship:  @friendship }
    else
      redirect_to :back
    end
  end

  def destroy
    @friendship = Friendship.find(params[:id])
    user = @friendship.friender.id == current_user.id ? @friendship.friendee : @friendship.friender
    @friendship.destroy
    
    if request.xhr?
      render partial: "layouts/friend", locals: { user: user }
    else
      redirect_to :back
    end
  end
end
