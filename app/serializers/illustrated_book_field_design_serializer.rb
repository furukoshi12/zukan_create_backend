class IllustratedBookFieldDesignSerializer
  include JSONAPI::Serializer
  attributes :illustrated_book_id, :field_design_id, :content
end
