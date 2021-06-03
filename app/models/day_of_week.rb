class DayOfWeek < ApplicationRecord
  has_many :consultation_hours, inverse_of: :day_of_week
  has_many :clinics, through: :consultation_hours
end
