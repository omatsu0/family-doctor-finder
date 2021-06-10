class CreateConsultationHours < ActiveRecord::Migration[6.0]
  def change
    create_table :consultation_hours do |t|
      t.time :start_at
      t.time :end_at
      t.references :clinic, type: :integer, null: false, foreign_key: true, index: false
      t.integer :day_of_weeks,  array: true, default: []

      t.timestamps
    end

    add_index :consultation_hours, :clinic_id
  end
end
