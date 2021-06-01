class Form::ConsultationHour < ConsultationHour
  REGISTRABLE_ATTRIBUTES = %i(id clinic_id day_of_week_id start_at end_at destroy)

  def selectable_dayofweeks
    DayOfWeek.all
  end
end