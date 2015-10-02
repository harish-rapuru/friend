class HomeController < ApplicationController

  def index
    @friends = current_user.all_friends.first(10)
    @feed_posts = current_user.feed_posts
    @pending_friendships = current_user.pending_friendships
    @post = Post.new
    @comment = Comment.new
  end

end
