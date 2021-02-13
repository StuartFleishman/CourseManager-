class User < ApplicationRecord
  has_many :notes
  has_many :courses, through: :notes 

  has_secure_password 

  validates :name, presence: true
  validates :email, :uniqueness => true 

  def self.create_from_omniauth(auth)
    User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u| 
      u.email = auth['info']['email']
      u.name = auth['info']['name']
      u.password = SecureRandom.hex(16)
    end
  end
end
