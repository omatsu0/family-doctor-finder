class ConsultationHour < ApplicationRecord
  belongs_to :clinic

  validates :start_at, presence: true
  validates :end_at, presence: true
  validates :day_of_week, presence: true
  validates :clinic, presence: true
end
