class Department < ApplicationRecord
  validates :department_name, length: { maximum: 20 }, presence: true
end
