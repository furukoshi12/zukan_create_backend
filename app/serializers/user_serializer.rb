class UserSerializer
  include JSONAPI::Serializer
  attributes :name, :email
  set_key_transform :camel_lower

  has_many :illustrated_books
end
