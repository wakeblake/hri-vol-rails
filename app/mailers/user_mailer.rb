class UserMailer < ActionMailer::Base
    default from: "humanrightsinitiativentx@gmail.com"

    def registration_confirmation(user)
        @user = user
        mail(to: "#{@user.first_name} <#{@user.email}>", subject: "Registration Confirmation")
    end
end