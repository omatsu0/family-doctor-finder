class ConsultationHour < ApplicationRecord
  belongs_to :clinic,inverse_of: :consultation_hours  
end
