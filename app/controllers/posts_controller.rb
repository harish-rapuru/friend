class PostsController < ApplicationController

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to :back
    else
      redirect_to :back
    end
  end

  def like
    @post = Post.find(like_params[:post_id])
    if current_user.like!(@post)
      redirect_to :back
    end
  end

  def unlike
    @post = Post.find(like_params[:post_id])
    current_user.unlike!(@post)
    redirect_to :back
  end

private

  def post_params
    params.require(:post).permit(:body)
  end

  def like_params
    params.permit(:post_id)
  end
end
