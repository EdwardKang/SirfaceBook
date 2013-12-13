class FriendshipsController < ApplicationController
  before_filter :require_user!

  def create
    @friendship = Friendship.new(params[:friendship])
    @friendship.is_pending = true
    @friendship.save
    redirect_to :back
  end

  def update
    @friendship = Friendship.find_by_friender_id_and_friendee_id(
      params[:friendship][:friender_id], params[:friendship][:friendee_id]
    )

    params[:friendship][:is_pending] = false
    @friendship.update_attributes(params[:friendship])
    redirect_to :back
  end

  def destroy
    @friendship = Friendship.find(params[:id])
    @friendship.destroy
    redirect_to :back
  end
end
