class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
    
        if @user.save
            # Active Job's default adapter runs jobs with an in-process thread pool. 
            # It's well-suited for the development/test environments, since it doesn't require any external infrastructure, 
            # but it's a poor fit for production since it drops pending jobs on restart. 
            # If you need a persistent backend, you will need to use an Active Job adapter that has a persistent backend (Sidekiq, Resque, etc).

            UserMailer.registration_confirmation(@user).deliver_now
            flash[:notice] = "A confirmation email was just sent to #{@user.email}. Please click the link in that email to continue."
            redirect_to root_url
            #session[:user_id] = @user.id
            #redirect_to '/cases' 
        else
            flash[:alert] = "Oops, something went wrong!"
            redirect_to '/signup'
        end
    end

    def confirm_email
        @user = User.find_by_confirm_token(params[:confirm_token])
        if @user
            @user.email_activate
            flash[:notice] = "Your email #{@user.email} has been confirmed.  Please log in to continue."
            redirect_to root_url
        else
            flash[:alert] = "Sorry, this user does not exist"
            redirect_to root_url
        end
    end

    private
    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password)
    end
end
