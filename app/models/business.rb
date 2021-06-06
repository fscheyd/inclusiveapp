class Business < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews

    validates :business_name, presence: { message: "must be given please" }
    validates :business_type, presence: { message: "must be given please" }

  
    def self.business_list

        @businesses = []

        Business.all.each do |business|
            @business_info = [business.business_name, business.id]
            @businesses << @business_info
        end

        @businesses
    end
end
