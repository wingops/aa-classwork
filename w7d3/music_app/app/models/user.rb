class User < ApplicationRecord
    def password=(password)
        self.password_hash = BCrypt::Password.create(password)
    end
    
    def is_password?(password)
        BCrypt::Password.new(self.password_hash).is_password?(password)
    end
end