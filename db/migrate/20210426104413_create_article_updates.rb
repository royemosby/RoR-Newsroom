class CreateArticleUpdates < ActiveRecord::Migration[6.1]
  def change
    create_table :article_updates do |t|
      t.integer :updater_id
      t.references :article, null: false, foreign_key: true
      t.text :content
      t.string :update_type

      t.timestamps
    end
  end
end
