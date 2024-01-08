class IllustratedBookSerializer
  include JSONAPI::Serializer
  attributes :title, :image, :image_x_position, :image_y_position
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
        id: illustrated_book_field_design.id,
        field_design_id: illustrated_book_field_design.field_design_id,
        content: illustrated_book_field_design.content,
        height: illustrated_book_field_design.height,
        width: illustrated_book_field_design.width,
        x_position: illustrated_book_field_design.x_position,
        y_position: illustrated_book_field_design.y_position
      }
    end
  end
end