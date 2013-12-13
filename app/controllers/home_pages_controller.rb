class HomePagesController < ApplicationController
  before_filter :require_user!

  def root
    @news = Post.all.select { |post| current_user.friends_ids.include?(post.receiver_id) || current_user.friends_ids.include?(post.sender_id) }

    max_length = @news.length
    @news_feed_length = 10
    @news_feed_length = max_length if max_length < @news_feed_length
    render :root
  end
end
