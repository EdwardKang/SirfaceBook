class HomePagesController < ApplicationController
  before_filter :require_user!

  def root
    render :root
  end
end
