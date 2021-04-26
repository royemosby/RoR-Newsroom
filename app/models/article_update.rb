class ArticleUpdate < ApplicationRecord
  belongs_to :article
  belongs_to :updater, foreign_key: :updater_id, class_name: "Employee"
end
