class ChangeMemosToAnnouncements < ActiveRecord::Migration[6.0]
  def change
    rename_table :memos, :announcements
  end
end
