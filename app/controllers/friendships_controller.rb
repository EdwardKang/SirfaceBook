class FriendshipsController < ApplicationController
  before_filter :require_user!

  def create
    @friendship = Friendship.new(params[:friendship])
    @friendship.is_pending = true
    @friendship.save
    redirect_to :back
  end

  def update

  end

  def destroy
  end
end
