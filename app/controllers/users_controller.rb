class UsersController < ApplicationController
  before_filter :require_user!, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      log_in(@user)
      redirect_to new_profile_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = User.find(current_user.id)
  end
end
