class Project < ApplicationRecord
  belongs_to :agent
  
  validates :title, presence: true, length: { maximum: 50 }
  validates :schedule, presence: true, length: { maximum: 50 }
  
end
