class Tag < ApplicationRecord
  has_many :illustrated_book_tags, dependent: :destroy, foreign_key: 'tag_id'
  has_many :illustrated_books, through: :illustrated_book_tags
end
