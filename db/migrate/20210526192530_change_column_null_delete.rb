class ChangeColumnNullDelete < ActiveRecord::Migration[6.0]
  def change
    change_column_null :consultation_hours, :day_of_week_id, true
  end
end
