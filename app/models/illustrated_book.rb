class IllustratedBook < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :template
  has_many :likes, dependent: :destroy
  has_many :illustrated_book_tags, dependent: :destroy
  has_many :tags, through: :illustrated_book_tags
  has_many :illustrated_book_field_designs, dependent: :destroy
  has_many :field_designs, through: :illustrated_book_field_designs
end
