class User < ApplicationRecord
  has_many :reveiws
  has_many :businesses, through: :reviews
  has_secure_password

  validates :username, uniqueness: true
  validates :email, presence: true

  def self.create_from_omniauth(auth)
    User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
      u.username = auth['info']['name']
      u.email = auth['info']['email']
      u.password = SecureRandom.hex(16)
    end
  end
    

    
end
