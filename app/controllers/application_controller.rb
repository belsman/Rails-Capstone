class ApplicationController < ActionController::Base
    helper_method :current_user, :authenticated?, :current_time

    def authenticated?
        if session[:user_id]
            return !current_user.nil?
        end
        return false
    end

    def require_login
        return true if authenticated?
        redirect_to new_session_path, notice: 'You must Log-in to perform this action!'
    end

    def current_user
        if session[:user_id]
            @current_user ||= User.find(session[:user_id])
            return @current_user
        end
        return false
    end

    def login(user)
        session[:user_id] = user.id
    end

    def current_time
        Time.now
    end
end
