class ChangeDatatypeStartAtOfConsultationHours < ActiveRecord::Migration[6.0]
  def change
    change_column :consultation_hours, :start_at, :time
    change_column :consultation_hours, :end_at, :time
  end
end
