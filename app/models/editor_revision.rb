class EditorRevision < ApplicationRecord
  belongs_to :article
  belongs_to :reviewer, class_name: "Employee"

  validates :content, presence: true
end
