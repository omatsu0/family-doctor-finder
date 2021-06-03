class Clinic < ActiveRecord::Base
  belongs_to :user
  has_one :location, dependent: :destroy
  has_many :consultation_hours,inverse_of: :clinic
  has_many :day_of_weeks,through: :consultation_hours
  has_many :clinic_departments
  has_many :departments, through: :clinic_departments

  accepts_nested_attributes_for :consultation_hours,reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :clinic_departments, allow_destroy: true
  accepts_nested_attributes_for :location

  validates :clinic_name, presence: true
  validates :clinic_furigana, presence: true
  validates :is_pdf_ony, inclusion: { in: [true, false] }
  validates :is_valid, inclusion: { in: [true, false] }

  mount_uploader :pdf, ImageUploader
end
