module UsersHelper
  def user_params
    params.require(:user).permit(:username, :fullname, :avatar_image, :cover_image)
  end

  def user_id_param
    params.permit(:id)
  end
end
