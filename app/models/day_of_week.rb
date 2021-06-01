class DayOfWeek < ApplicationRecord
  has_many :consultation_hours
  has_many :clinics, through: :consultation_hours
end
