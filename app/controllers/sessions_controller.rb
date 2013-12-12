require 'bcrypt'

class SessionsController < ApplicationController
  before_filter :require_no_current_user!, only: [:new]

  def new
    @user = User.new
  end

  def create

    @user = User.find_by_credentials(params[:user][:email],
                                     params[:user][:password])

    if @user
      log_in(@user)
      redirect_to root_url
    else
      @user = User.new(params[:user])
      flash[:errors] = ["Invalid email password combination!"]
      render :new
    end
  end

  def destroy
    logout_current_user
    redirect_to new_session_url
  end
end