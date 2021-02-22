class Course < ApplicationRecord
  before_save :capitalize_name
  
  has_many :notes, dependent: :destroy
  has_many :users, through: :notes 

  validates :name, :subject, :teacher, uniqueness: true,  presence: true
 
  
  def capitalize_name
    self.name = self.name.split.collect(&:capitalize).join(' ') 
  end
  

  def self.alphabetical_name
     order(name: :asc).to_a
  end

  def self.find_or_create_by(course_params)
    Course.find_or_create_by(course_params)
  end

end
