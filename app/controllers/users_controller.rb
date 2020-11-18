class UsersController < ApplicationController
    include UsersHelper
    layout "buzzer", except: [:new]
  
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
        @user = User.find(params[:id])
        @user_buzzs = @user.buzzs
        @new_buzz = Buzz.new
    end

    def edit
        @user = User.find(params[:id])
        @show_media_edit = true
    end
  end
  