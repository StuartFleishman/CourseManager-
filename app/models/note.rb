class Note < ApplicationRecord
  belongs_to :user 
  belongs_to :course

  validates :content, length: { in: 6..500 }

  def course_attributes=(attr)
    attr.values.each do |a|
      course = Course.find_or_create_by(name: attr[:name], subject: attr[:subject], teacher: attr[:teacher])
      self.build_course(name: course)
    end
  end

  # def self.ordered_by_date
end
