class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.integer :employee_id, null: true
      t.string :title
      t.text :content
      t.string :status, default: "new"

      t.timestamps
    end
  end
end
