class ConsultationHour < ApplicationRecord
  belongs_to :clinic,inverse_of: :consultation_hours
  belongs_to :day_of_week,inverse_of: :consultation_hours
  # attribute :day_of_week_id, :integer, default: '1'
  # validates :availability, inclusion: { in: [true, false] }
  
end
