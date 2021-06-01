class Form::ClinicDepartment < ClinicDepartment
  REGISTRABLE_ATTRIBUTES = %i(id clinic_id department_id _destroy)

  def selectable_departments
    Department.all
  end

end