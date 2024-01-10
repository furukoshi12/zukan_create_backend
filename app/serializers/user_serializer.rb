class UserSerializer
  include JSONAPI::Serializer
  attributes :name, :email, :role
  set_key_transform :camel_lower
end
