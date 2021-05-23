class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string :address
      t.string :post_address
      t.float :latitude
      t.float :longitude
      t.integer :clinic_id, null: false

      t.timestamps
    end
    add_index :locations, :clinic_id
  end
end
