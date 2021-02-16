class Course < ApplicationRecord
  has_many :notes
  has_many :users, through: :notes 

  validates :name, :subject, :teacher, presence: true
  accepts_nested_attributes_for :notes


  def self.alphabetical_name
     order(name: :asc).to_a
  end

end
