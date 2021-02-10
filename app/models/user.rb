class User < ApplicationRecord
  has_many :notes
  has_many :classes, through: :notes 
end
