class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    helper_method :current_user 
    helper_method :logged_in?
    helper_method :validate_user_info
  
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
  
    def set_user
        cookies[:current_user_id] = current_user.id 
    end

    def logged_in?
      !!current_user
    end
  
    def require_login
      return redirect_to(controller: 'sessions', action: 'new') unless logged_in?
    end

    def user_exist
        if params[:user_id] && !User.exists?(params[:user_id])
            render ':welcome/index', message: "User not found"
        end
    end
    
    def match_user
        if params[:user_id] != current_user.id.to_s
            render ':welcome/index', message: "User ID authentication failure. You cannot edit other user's information."
        end
    end

    def validate_user_info 
        user_exist && match_user 
    end 
end
