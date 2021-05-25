class Clinic < ApplicationRecord
  belongs_to :user, optional: true
  has_one :location, dependent: :destroy
  has_many :consultation_hours, dependent: :destroy
  has_many :clinic_departments, dependent: :destroy
  has_many :departments, through: :clinic_departments
  has_many :memos, dependent: :destroy

  accepts_nested_attributes_for :location
  accepts_nested_attributes_for :clinic_departments
  accepts_nested_attributes_for :consultation_hours

  validates :clinic_name, presence: true
  validates :clinic_furigana, presence: true
  validates :is_pdf_ony, inclusion: { in: [true, false] }
  validates :is_valid, inclusion: { in: [true, false] }
end
