class User < ApplicationRecord
    has_many :reveiws
    has_many :businesses, through :reviews
    has_secure_password

    validates :username, uniqueness: true
    validates :email, presence: true
end
