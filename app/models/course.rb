class Course < ApplicationRecord
  before_save :capitalize_name
  
  has_many :notes, dependent: :destroy
  has_many :users, through: :notes 

  validates :name, presence: true
  validates_uniqueness_of :name, case_sensitive: false
 
  
  def capitalize_name
    self.name = self.name.split.collect(&:capitalize).join(' ') 
  end
  

  def self.alphabetical_name
     order(name: :asc).to_a
  end

end
