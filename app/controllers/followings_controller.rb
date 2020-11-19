class FollowingsController < ApplicationController
  before_action :require_login

  def create
    user = User.find(params[:user_id])
    current_user.follow(user)
    redirect_to user_path(user), notice: "You are now following #{user.fullname.upcase}"
  rescue StandardError => e
    redirect_to root_path, notice: "Can't complete this request"
  end

  def destroy
    user = User.find(params[:user_id])
    current_user.unfollow(user)
    redirect_to user_path(user), alert: "You have unfollowed #{user.fullname.upcase}"
  rescue StandardError => e
    redirect_to root_path, notice: "Can't complete this request"
  end
end
