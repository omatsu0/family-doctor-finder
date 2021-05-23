class ConsultationHour < ApplicationRecord
  validates :start_at, presence: true
  validates :start_at, presence: true
  validates :day_of_week, presence: true
  validates :clinic, presence: true
end
