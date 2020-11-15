module SessionsHelper
    def sessions_params
        params.require(:user).permit(:username)
    end
end
