class UserMailerPreview < ActionMailer::UserMailerPreview
    def registration_confirmation(user)
        @user = user
        UserMailer.with(@user).registration_confirmation
    end
end