# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  user_name       :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
    validates :user_name, :session_token, presence: true, uniqueness: true 
    validates :password_digest, presence: true 

    after_initialize :ensure_session_token 

    def ensure_session_token
        self.session_token ||= SecureRandom::urlsafe_base64(16)
    end

    def reset_session_token!
        self.session_token = SecureRandom::urlsafe_base64(16)
        self.save!
        self.session_token
    end

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
        #is_password? referes to BCrypt method
    end

    def self.find_by_credentials(username, password)
        user = User.find_by(user_name: username)
        return nil if user.nil?
        user.is_password?(password) ? user : nil
    end

    private

    attr_reader :password


end

