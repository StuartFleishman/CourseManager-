class Course < ApplicationRecord
  before_save :capitalize_name
  
  has_many :notes
  has_many :users, through: :notes 

  validates :name, :subject, :teacher, presence: true

  def capitalize_name
    self.name = self.name.split.collect(&:capitalize).join(' ') 
  end
  

  def self.alphabetical_name
     order(name: :asc).to_a
  end

end
