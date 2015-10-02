class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @friends = @user.all_friends
    @user_posts = @user.posts.order(created_at: :desc)
    @post = Post.new
    @comment = Comment.new
  end

  def edit
    @user = current_user
  end

  def update
    user = current_user
    if user.update(user_params)
      redirect_to :root
    else
      render :edit
    end
  end

private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :avatar)
  end

end
