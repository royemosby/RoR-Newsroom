class EditorRevision < ApplicationRecord
  belongs_to :article
  belongs_to :reviewer, foreign_key: :reviewer_id, class_name: "Employee"
end
