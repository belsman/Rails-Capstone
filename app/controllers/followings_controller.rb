class FollowingsController < ApplicationController
    before_action :require_login

    def create
        begin
            user = User.find(params[:user_id])
            current_user.follow(user)
            redirect_to user_path(user), notice: "You are now following #{user.fullname.upcase}"
        rescue => exception
            redirect_to root_path, notice: "Can't complete this request"
        end
    end

    def destroy
        begin
            user = User.find(params[:user_id])
            current_user.unfollow(user)
            redirect_to user_path(user), notice: "You have unfollowed #{user.fullname.upcase}"
        rescue => exception
            redirect_to root_path, notice: "Can't complete this request"
        end
    end
end
