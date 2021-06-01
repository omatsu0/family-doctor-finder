class Form::Clinic < Clinic
  REGISTRABLE_ATTRIBUTES = %i(clinic_name clinic_furigana clinic_admin_number director_name phone_number introduction pdf is_pdf_ony is_valid)
  REGISTRABLE_RELATIONS = [day_of_week_ids:[]]

  has_many :clinic_departments, class_name: 'Form::ClinicDepartment'
  has_many :consultation_hours, class_name: 'Form::ConsultationHour'
  has_one :location, class_name: 'Form::Location'

  after_initialize { consultation_hours.build unless self.persisted? || consultation_hours.present? }

  def selectable_dayofweeks
    DayOfWeek.all
  end
end