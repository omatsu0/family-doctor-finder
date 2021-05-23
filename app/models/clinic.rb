class Clinic < ApplicationRecord
  belongs_to :user, optional: true
  has_many :consultation_hours, dependent: :destroy
  has_many :clinic_departments, dependent: :destroy
  has_many :memos, dependent: :destroy

  validates :clinic_name, presence: true
  validates :is_pdf_ony, inclusion: { in: [true, false] }
  validates :is_valid, inclusion: { in: [true, false] }
end
