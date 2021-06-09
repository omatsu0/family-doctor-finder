class AddDayofweeknToConsultationHours < ActiveRecord::Migration[6.0]
  def change
    add_column :consultation_hours, :dayofweekn, :integer, array: true
  end

end
