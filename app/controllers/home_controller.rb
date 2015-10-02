class HomeController < ApplicationController

  def index
    @friends = current_user.all_friends.first(10)
    @feed_posts = current_user.feed_posts
    @post = Post.new
    @comment = Comment.new
  end

end
