class UserSerializer
  include JSONAPI::Serializer
  attributes :name, :email

  set_key_transform :camel_lower
end
