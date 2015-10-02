class FriendsController < ApplicationController
  def find
    @users = User.all
    @pending_friendships = current_user.pending_friendships
    @all_friendship_users = current_user.all_friendship_users
  end
end
