class RemoveDayOfWeekToConsultationHours < ActiveRecord::Migration[6.0]
  def change
    remove_column :consultation_hours, :day_of_week, :string
  end
end
