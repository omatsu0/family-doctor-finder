class CreateConsultationHours < ActiveRecord::Migration[6.0]
  def change
    create_table :consultation_hours do |t|
      t.datetime :start_at, null: false
      t.datetime :end_at, null: false
      t.string :day_of_week, null: false
      t.integer :clinic_id, null: false

      t.timestamps
    end

    add_index :consultation_hours, :clinic_id
  end
end
