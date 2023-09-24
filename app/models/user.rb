class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :api_keys

  validates :password, length: { minimum: 5 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true
  
  def activate_api_key!
    return api_keys.active.first if api_keys.active.exists?
    api_keys.create
  end
end
