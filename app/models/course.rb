class Course < ApplicationRecord
  has_many :notes 
  has_many :users, through: :notes 

  validates :name, :subject, :course, presence: true
  
end
