class User < ApplicationRecord
    has_secure_password
    has_many :teams

    validates :username, uniqueness: {case_sensitive: false}
    validates :username, prescence: true
    validates :email, uniqueness: true
    validates :email, prescence: true
    validates :password, prescence: true, if: :password

end
