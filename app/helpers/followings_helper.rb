module FollowingsHelper
    def user_params
        params.permit(:user_id, :authenticity_token, :button)
    end
end
