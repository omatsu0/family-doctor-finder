class ChangeDatatypePdfOfClinics < ActiveRecord::Migration[6.0]
  def change
    change_column :clinics, :pdf, :string
  end
end
