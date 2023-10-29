class IllustratedBookTag < ApplicationRecord
  belongs_to :illustrated_book
  belongs_to :tag
end
