class AddUsernameToEmployees < ActiveRecord::Migration[6.1]
  def change
    add_column :employees, :username, :string
  end
end
