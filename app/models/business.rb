class Business < ApplicationRecord
    has_many :reviews
    has_many :users, through :reviews

    validates :business_name, presence: { message: "must be given please" }
    validates :business_type, presence: { message: "must be given please" }

   #some crud functionality
end
