class User < ApplicationRecord
    has_secure_password

    # TODO what to do for super users?
    def admin?
        self.role == 'admin'
    end

    # TODO create aggregate page for managers?
    def manager?
        self.role == 'manager'
    end
end
