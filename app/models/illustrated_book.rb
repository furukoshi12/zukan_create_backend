class IllustratedBook < ApplicationRecord
  belongs_to :user, optional: true
  has_many :likes, dependent: :destroy
  has_many :illustrated_book_tags, dependent: :destroy
  has_many :tags, through: :illustrated_book_tags
end
