class CreateDepartments < ActiveRecord::Migration[6.0]
  def change
    create_table :departments do |t|
      t.string :department_name, null: false

      t.timestamps
    end
  end
end
