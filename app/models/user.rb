class User < ApplicationRecord
    has_many :reveiws
    has_many :businesses, through :reviews
end
