class AddUidGhNameEmailToEmployees < ActiveRecord::Migration[6.1]
  def change
    add_column :employees, :gh_uid, :string
    add_column :employees, :gh_name, :string
    add_column :employees, :gh_email, :string
  end
end
