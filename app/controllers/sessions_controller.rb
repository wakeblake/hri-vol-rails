class SessionsController < ApplicationController
    def new
    end

    def create
        @user = User.find_by_email(params[:session][:email])
        if @user && @user.authenticate(params[:session][:password])
            if @user.email_confirmed
                session[:user_id] = @user.id
                redirect_to '/cases'          # TODO is this right?
            else
                flash.now[:alert] = "To proceed please activate your account by following the instructions in the confirmation email sent to you."
                redirect_to '/' # ?????
            end
        else
            flash.now[:alert] = "Invalid email/password combination"
            redirect_to '/'
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to '/'
    end
end
