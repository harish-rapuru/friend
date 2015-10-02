class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @friends = @user.all_friends
    @user_posts = @user.posts.order(created_at: :desc)
    @post = Post.new
    @comment = Comment.new
  end

end
