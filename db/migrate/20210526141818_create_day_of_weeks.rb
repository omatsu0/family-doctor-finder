class CreateDayOfWeeks < ActiveRecord::Migration[6.0]
  def change
    create_table :day_of_weeks do |t|
      t.string :day_of_week, null: false, unique: true

      t.timestamps
    end
  end
end
