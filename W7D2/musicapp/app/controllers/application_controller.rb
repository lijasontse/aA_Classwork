class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :current_user
    helper_method :logged_in?


    def current_user
        return nil unless session[:session_token]
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def require_logged_in
        # redirect them to the login page, so they can login
        # if new user, login page should have sign up page,
        # so they can sign up 
        redirect_to new_session_url unless logged_in?
        # change 'login_page' so we can get the routes for it 

    end

    def require_logged_out
        redirect_to users_url if logged_in? 
        # not what it's suppose to be on this, rewrite just notes
    end

    def logged_in?
        !current_user.nil?
    end

    def login_user!(user)
        session[:session_token] = user.reset_session_token!
    end

    def logout!
        current_user.reset_session_token! if current_user
        # reset the current user's session token if there is one 
        session[:session_token] = nil
        @current_user = nil
        # unset the instance variable of current user
        # there shouldn't be a current_user
    end
end
