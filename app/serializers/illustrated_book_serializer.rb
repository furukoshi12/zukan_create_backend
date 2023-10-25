class IllustratedBookSerializer
  include JSONAPI::Serializer
  attributes :title
  set_key_transform :camel_lower
  
  belongs_to :user
end