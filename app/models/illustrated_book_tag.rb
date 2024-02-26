class IllustratedBookTag < ApplicationRecord
  belongs_to :illustrated_book
  belongs_to :tag

  validates :illustrated_book_id, presence: true
  validates :tag_id, presence: true
end
