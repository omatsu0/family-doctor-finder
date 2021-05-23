class CreateClinicDepartments < ActiveRecord::Migration[6.0]
  def change
    create_table :clinic_departments do |t|
      t.references :clinic, null: false, foreign_key: true, index: false
      t.references :user, null: false, foreign_key: true, index: false

      t.timestamps
    end

    add_index :clinic_departments, %i[clinic_id user_id]
  end
end
