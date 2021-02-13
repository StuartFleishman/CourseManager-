class User < ApplicationRecord
  has_many :notes
  has_many :courses, through: :notes 

  has_secure_password 

  # validates :first_name, presence: true
  # validates :email, uniqueness: true
end
