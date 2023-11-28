class Template < ApplicationRecord
  has_many :illustrated_books
  has_many :template_field_designs, dependent: :destroy
  has_many :field_designs, through: :template_field_designs
end
