class UsersController < ApplicationController
  before_action :require_login, only: %i[show edit update]
  include UsersHelper
  layout 'buzzer', except: [:new]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login(@user)

      redirect_to buzzs_path, notice: "#{@user.username}, You're welcome to buzzer."
    else
      render :new
    end
  end

  def show
    @user = User.find_by_id!(params[:id])
    @user_buzzs = @user.buzzs.ordered_by_most_recent
    @users_who_followed = @user.users_who_followed
    @new_buzz = Buzz.new
  end

  def edit
    @user = User.find_by_id!(user_id_param)
    @show_media_edit = true
  end

  def update
    @user = User.find_by_id!(user_id_param)

    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'Your profile has been updated.'
    else
      redirect_to user_path(@user), alert: "Can't complete this action."
    end
  end
end
