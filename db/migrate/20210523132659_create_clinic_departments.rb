class CreateClinicDepartments < ActiveRecord::Migration[6.0]
  def change
    create_table :clinic_departments do |t|
      t.references :clinic,type: :integer, null: false, foreign_key: true, index: false
      t.references :department, type: :integer, null: false, foreign_key: true, index: false

      t.timestamps
    end

    add_index :clinic_departments, %i[clinic_id department_id]
  end
end
