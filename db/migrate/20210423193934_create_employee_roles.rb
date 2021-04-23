class CreateEmployeeRoles < ActiveRecord::Migration[6.1]
  def change
    create_table :employee_roles do |t|
      t.references :employee, null: false, foreign_key: true
      t.references :role, null: false, foreign_key: true

      t.timestamps
    end
  end
end
