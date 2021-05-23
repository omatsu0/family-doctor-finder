class Memo < ApplicationRecord
  validates :body, length: { maximum: 100 }, presence: true
  validates :clinic, presence: true
  validates :user, presence: true
end
