class CreateMemos < ActiveRecord::Migration[6.0]
  def change
    create_table :memos do |t|
      t.text :body, null: false
      t.integer :user_id, null: false
      t.integer :clinic_id, null: false

      t.timestamps
    end
  end
end
