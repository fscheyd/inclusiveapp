class Review < ApplicationRecord
    belongs_to :user
    belongs_to :business


    validates :review_title, presence: true
    validates :review_body, length: { in: 3..100 }
    validates_numericality_of :accesibility_rating, :less_than_or_equal_to => 5
    validates :accesibility_features, presence: true
    #full crud functionality

    
end
