class FriendshipsController < ApplicationController

  def create
    @friendship = current_user.friendships.new(friendship_params)
    if @friendship.save
      redirect_to :back
    else
      redirect_to :back
    end
  end

  def update
    @friendship = current_user.pending_friendships.find(params[:id])
    @friendship.accepted = true
    if @friendship.save
      redirect_to :back
    else
      redirect_to :back
    end
  end

  def destroy
    @friendship = current_user.pending_friendships.find(params[:id])
    if @friendship.delete
      redirect_to :back
    else
      redirect_to :back
    end
  end

private

  def friendship_params
    params.require(:friendship).permit(:friend_id)
  end
end
