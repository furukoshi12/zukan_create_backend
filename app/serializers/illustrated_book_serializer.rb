class IllustratedBookSerializer
  include JSONAPI::Serializer
  attributes :title
  set_key_transform :camel_lower
  
  belongs_to :user

  attribute :tags do |illustrated_book, params|
    illustrated_book.tags.map { |tag| tag.name }
  end
end