class IllustratedBook < ApplicationRecord
  after_initialize :set_default_template

  mount_uploader :image, ImageUploader

  belongs_to :user, optional: true
  belongs_to :template, class_name: 'Template'
  has_many :likes, dependent: :destroy
  has_many :illustrated_book_tags, dependent: :destroy
  has_many :tags, through: :illustrated_book_tags
  has_many :illustrated_book_field_designs, dependent: :destroy
  has_many :field_designs, through: :illustrated_book_field_designs

  accepts_nested_attributes_for :illustrated_book_field_designs

  private

  def set_default_template
    self.template_id ||= 1
  end
end
