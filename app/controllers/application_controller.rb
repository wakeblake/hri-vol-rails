class ApplicationController < ActionController::Base
    helper_method :current_user

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def require_user
        redirect_to '/login' unless current_user
    end

    # TODO redirect to attorney case page?
    def require_manager
        redirect_to '/' unless current_user.manager?
    end

    # TODO what here?
    def require_admin
        redirect to '/' unless current_user.admin?
    end
end
