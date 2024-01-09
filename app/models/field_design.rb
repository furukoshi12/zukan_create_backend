class FieldDesign < ApplicationRecord
  has_many :template_field_designs, dependent: :destroy
  has_many :templates, through: :template_field_designs
  has_many :illustrated_book_field_designs, dependent: :destroy
  has_many :illustrated_books, through: :illustrated_book_field_designs

  enum label: { 学名: 0, 和名: 1, 生態: 2 }
  enum background_color: { 'background_#FADCB2': 1, 'background_#B2E7F9': 2, 'background_#DDF4BF': 3 }
  enum color: { '#F55C20': 1, '#338527': 2, '#3349AF': 3 }
  enum border_color: { '#FADCB2': 1, '#B2E7F9': 2, '#DDF4BF': 3 }
  enum border_style: { 'solid': 1, 'groove': 2, 'dotted': 3, 'dashed': 4 }
  enum border_radius: { '10': 0, '30': 1, '50': 2, '100': 3  }
  enum font_family: { 'serif': 0, 'sansSerif': 1, 'monospace': 2 }
  enum font_size: { '12': 0, '16': 1, '23': 2 }

  def remove_background_prefix
    background_color.sub(/\Abackground_/, '') if background_color
  end
end
