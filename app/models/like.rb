class Like < ApplicationRecord
  belongs_to :user
  belongs_to :illustrated_book

  validates_uniqueness_of :illustrated_book_id, scope: :user_id
end
