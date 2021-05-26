class AddDayOfWeekRefToConsultationHours < ActiveRecord::Migration[6.0]
  def change
    add_reference :consultation_hours, :day_of_week, null: false, foreign_key: true
  end
end
