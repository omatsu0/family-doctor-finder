class CreateConsultationHours < ActiveRecord::Migration[6.0]
  def change
    create_table :consultation_hours do |t|
      t.time :start_at
      t.time :end_at
      t.references :clinic, type: :integer, null: false, foreign_key: true, index: false
      t.references :day_of_week, type: :integer, null: false, foreign_key: true, index: false

      t.timestamps
    end

    add_index :consultation_hours, %i[clinic_id day_of_week_id]
  end
end
