class ConsultationHour < ApplicationRecord
  belongs_to :clinic,inverse_of: :consultation_hours
  belongs_to :day_of_week,inverse_of: :consultation_hours
  # validates :availability, inclusion: { in: [true, false] }
  
end
