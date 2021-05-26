class Announcement < ApplicationRecord
  belongs_to :user
  belongs_to :clinic
  
  validates :body, length: { maximum: 100 }, presence: true
  validates :clinic, presence: true
  validates :user, presence: true
end
