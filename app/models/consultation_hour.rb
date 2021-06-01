class ConsultationHour < ApplicationRecord
  belongs_to :clinic
  belongs_to :day_of_week

  # validates :availability, inclusion: { in: [true, false] }
  
end
