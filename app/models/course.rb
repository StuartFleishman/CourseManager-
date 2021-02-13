class Course < ApplicationRecord
  has_many :notes 
  has_many :users, through: :notes 

  validates :name, :subject, :teacher, presence: true
  accepts_nested_attributes_for :notes

end
