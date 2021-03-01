class UsersController < ApplicationController

    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            render plain: "Test"
            #login!(user)
        else
            @user.errors.full_messages
            render :new
        end
    end

    private
    def user_params
        params.require(:user).permit(:user_name, :password)
    end


end