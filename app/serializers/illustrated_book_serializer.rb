class IllustratedBookSerializer
  include JSONAPI::Serializer
  attributes :title
  set_key_transform :camel_lower
  
  belongs_to :user
  belongs_to :template
  has_many :illustrated_book_field_designs, serializer: IllustratedBookFieldDesignSerializer

  attribute :tags do |illustrated_book|
    illustrated_book.tags.map { |tag| tag.name }
  end

  attribute :illustrated_book_field_designs do |object|
    object.illustrated_book_field_designs.map do |illustrated_book_field_design|
      {
        field_design_id: illustrated_book_field_design.field_design_id,
        content: illustrated_book_field_design.content
      }
    end
  end
end