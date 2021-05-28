class AddIsValidToAnnouncements < ActiveRecord::Migration[6.0]
  def change
    add_column :announcements, :is_valid, :boolean, default: true
    add_column :announcements, :priority, :integer
  end
end
