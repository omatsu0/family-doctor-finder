class ClinicDepartment < ApplicationRecord
  belongs_to :clinic
  belongs_to :user
end
