class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :api_keys, dependent: :destroy
  has_many :illustrated_books, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_illustrated_books, through: :likes, source: :illustrated_book

  validates :password, length: { minimum: 5 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true
  
  def activate_api_key!
    return api_keys.active.first if api_keys.active.exists?
    api_keys.create
  end

  def like(illustrated_book)
    like_illustrated_books << illustrated_book
  end

  def unlike(illustrated_book)
    like_illustrated_books.destroy(illustrated_book)
  end

  def like?(illustrated_book)
    like_illustrated_books.include?(illustrated_book)
  end
end
