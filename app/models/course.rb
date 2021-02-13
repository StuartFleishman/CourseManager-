class Course < ApplicationRecord
  has_many :notes 
  has_many :users, through: :notes 


  accepts_nested_attributes_for :notes

end
