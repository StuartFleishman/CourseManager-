class Note < ApplicationRecord
  belongs_to :user
  belongs_to :course

  validates :content, length: { in: 6..1000 }

  def self.created_at
    order(created_at: :desc).to_a
  end


end
