class SessionsController < ApplicationController
    before_action :require_logged_in, only: [:destroy]
    # require someone to be logged in in order to destroy(log out)
    before_action :require_logged_out, only: [:new, :create]
    # require someone to be logged out, in order to access new form to create (sign up)
    
    def new
        user = User.new 
        render :new 
    end

    def create
        # could be also @user, so we can access it in the view
        # could just be user if we dont need to access it in the view 
        user = User.find_by_credentials(
            params[:user][:email],
            params[:user][:password]
        )

        if user
            login_user!(user)
            redirect_to user_url(user)
        else
            flash.now[:errors] = ["Incorrect username and/or password"]
            # we do flash.now instead of flash b/c
            # if we use flash, this is a cookie, this cookie lives for current and next (thats it)
            # we want to use flash.now, only lives for the current response cycle
            # if render something, use flash.now
            # if redirect use flash 
            render :new
        end
    end

    def destroy
        logout!
        redirect_to new_session_url
    end


end
