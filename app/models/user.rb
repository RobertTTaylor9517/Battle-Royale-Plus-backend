class User < ApplicationRecord
    has_secure_password
    has_many :teams
    has_many :save_states

    validates :username, uniqueness: {case_sensitive: false}
    validates :username, presence: true
    validates :email, uniqueness: true
    validates :email, presence: true
    validates :password, presence: true, if: :password

end
