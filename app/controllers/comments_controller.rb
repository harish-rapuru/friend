class CommentsController < ApplicationController

  def create
    @comment = current_user.comments.new(comment_params)
    @post = Post.find(comment_params[:post_id])
    @comment.post = @post
    if @comment.save
      redirect_to :back
    else
      redirect_to :back
    end
  end

private
  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end

end
