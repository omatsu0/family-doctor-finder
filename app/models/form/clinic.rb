class Form::Clinic < Clinic
  REGISTRABLE_ATTRIBUTES = %i(clinic_name clinic_furigana clinic_admin_number director_name phone_number introduction pdf is_pdf_ony is_valid)

  has_many :clinic_departments
  has_one :location
end