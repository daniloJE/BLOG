class ApplicationController < ActionController::Base
    # The methods that i made here are available to all of my controllers but not to my views by default
    protect_from_forgery with: :exception 
    helper_method :current_user, :logged_in?  # with this line i make them available to my views
    def current_user 
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!current_user
    end

    def require_user
        if !logged_in?
            flash[:danger] = "You must be logged in to perform that action"
            redirect_to root_path
        end
    end
end
