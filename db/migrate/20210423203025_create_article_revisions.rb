class CreateArticleRevisions < ActiveRecord::Migration[6.1]
  def change
    create_table :article_revisions do |t|
      t.text :content
      t.integer :reviewer_id
      t.references :article, null: false, foreign_key: true

      t.timestamps
    end
  end
end
