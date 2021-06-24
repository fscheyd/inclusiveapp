class ApplicationController < ActionController::Base
    include ReviewHelper
    # gives access to the views
    helper_method :current_user, :logged_in?
    # before_action :require_login
    def require_login
        unless logged_in?
          flash[:error] = "You must be logged in to access this section"
          redirect_to login_path
        end
    end
        
    def current_user
        
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
        
    def logged_in?
        current_user
    end

    def redirect_if_not_logged_in
        if !@current_user
            render '/users/new'
        end
    end
end