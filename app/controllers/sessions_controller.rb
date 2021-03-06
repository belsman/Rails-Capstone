class SessionsController < ApplicationController
  include SessionsHelper
  def new
    @user = User.new
  end

  def create
    @user = User.where(username: sessions_params[:username]).first
    if @user
      login(@user)
      redirect_to root_path, notice: "Successfully logged in as #{@user.username}"
    else
      @user = User.new
      flash.now[:notice] = "Logging in failed. #{sessions_params[:username]} doesn't exist!"
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to new_session_path
  end
end
