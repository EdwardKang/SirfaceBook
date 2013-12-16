class UsersController < ApplicationController
  before_filter :require_no_current_user!, only: :new
  before_filter :require_user!, except: [:new, :create]

  def index
    @users = User.all
  end

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

  def wall
    @user = User.find(params[:id])
  end

  def photos
    @user = User.find(params[:id])
  end

  def about
    @user = User.find(params[:id])
  end

  def friends
    @user = User.find(params[:id])
  end
end
