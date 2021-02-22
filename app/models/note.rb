class Note < ApplicationRecord
  belongs_to :user
  belongs_to :course

  validates :content, length: { in: 6..500 }

  def course_attributes=(attr)
        self.course = Course.find_or_create_by(name: attr[:name], subject: attr[:subject], teacher: attr[:teacher])
  end

  def self.created_at
    order(:created_a).to_a
 end


end
