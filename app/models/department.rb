class Department < ApplicationRecord
  has_many :clinic_departments
  has_many :clinic, through: :clinic_departments
  
  validates :department_name, length: { maximum: 20 }, presence: true
end
