class CommentsController < ApplicationController
  before_filter :require_user!
end
