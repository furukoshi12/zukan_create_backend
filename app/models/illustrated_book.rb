class IllustratedBook < ApplicationRecord
  belongs_to :user, optional: true
end
