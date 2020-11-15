module UsersHelper
    def user_params
      params.require(:user).permit(:username, :fullname)
    end
end