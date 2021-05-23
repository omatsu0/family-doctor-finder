class CreateClinics < ActiveRecord::Migration[6.0]
  def change
    create_table :clinics do |t|
      t.string :clinic_name, null: false
      t.string :clinic_admin_number
      t.string :director_name
      t.string :phone_number
      t.text :introduction
      t.integer :user_id, null: false
      t.bigint :pdf
      t.boolean :is_pdf_ony, default: false
      t.boolean :is_valid, default: true

      t.timestamps
    end

    add_index :clinics, :user_id
  end
end
