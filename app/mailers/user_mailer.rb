class UserMailer < ActionMailer::Base

    #https://guides.rubyonrails.org/action_mailer_basics.html
    #https://coderwall.com/p/u56rra/ruby-on-rails-user-signup-email-confirmation-tutorial

    default from: "humanrightsinitiativentx@gmail.com"

    def registration_confirmation(user)
        @user = user
        mail(to: "#{@user.first_name} <#{@user.email}>", subject: "Registration Confirmation")
    end
end