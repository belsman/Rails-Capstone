class FollowingsController < ApplicationController
  before_action :require_login

  def create
    user = User.find_by_id!(params[:user_id])
    current_user.follow(user)
    redirect_to user_path(user), notice: "You are now following #{user.fullname.upcase}"
  end

  def destroy
    user = User.find_by_id!(params[:user_id])
    redirect_to user_path(user), alert: "You have unfollowed #{user.fullname.upcase}"
  end
end
