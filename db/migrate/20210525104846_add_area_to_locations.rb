class AddAreaToLocations < ActiveRecord::Migration[6.0]
  def change
    add_column :locations, :area_id, :integer
  end
end
