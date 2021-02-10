class User < ApplicationRecord
  has_many :notes
  has_many :courses, through: :notes 

  has_secure_password 
end
