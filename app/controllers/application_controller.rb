class ApplicationController < ActionController::Base
    helper_method :current_user, :authenticated?
    
    def require_login
        return true if authenticated?
    
        redirect_to new_session_path, notice: 'You must Log-in to perform this action!'
    end

    def current_user
        @current_user ||= User.find_by_id!(session[:user_id])
    end

    def authenticated?
        @current_user
    end

    def login(user)
        session[:user_id] = user.id
    end
end
