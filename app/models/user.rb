class User < ApplicationRecord
    before_create :confirmation_token
    has_secure_password

    # TODO what to do for super users?
    def admin?
        self.role == 'admin'
    end

    # TODO create aggregate page for managers?
    def manager?
        self.role == 'manager'
    end

    def email_activate
        self.email_confirmed = true
        self.confirm_token = nil
        save!(validate: false) # check to make sure that password exists and passes validation rule
    end
    
    private
    def confirmation_token
        if self.confirm_token.blank?
            self.confirm_token = SecureRandom.urlsafe_base64.to_s
        end
    end
end
