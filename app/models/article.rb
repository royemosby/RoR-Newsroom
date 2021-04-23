class Article < ApplicationRecord
  belongs_to :employee, optional: true
end
