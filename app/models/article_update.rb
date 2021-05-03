class ArticleUpdate < ApplicationRecord
  #leaving in for future app enhancements regarding employee authorizations
  belongs_to :article
  belongs_to :updater, foreign_key: :updater_id, class_name: "Employee"
  validates :content, presence: true
end
