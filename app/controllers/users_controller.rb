class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
    
        if @user.save
            UserMailer.registration_confirmation(@user).deliver
            flash[:success] = "Please confirm your email address to continue"
            redirect_to '/'
            #session[:user_id] = @user.id
            #redirect_to '/cases' 
        else
            flash[:error] = "Oops, something went wrong!"
            redirect_to '/signup'
        end
    end

    def confirm_email
        @user = User.find_by_confirm_token(params[:id])
        if @user.email_activate
            flash[:success] = "Your email has been confirmed.  Please log in to continue."
            redirect_to '/'
        else
            flash[:error] = "Sorry, this user does not exist"
            redirect_to '/'
        end
    end
    
    private
    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password)
    end
end
