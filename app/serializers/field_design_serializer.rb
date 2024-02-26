class FieldDesignSerializer
  include JSONAPI::Serializer
  attributes :label, :background_color, :color, :border_color, :border_style, :border_radius, :font_family, :font_size

  attribute :background_color do |object|
    object.remove_background_prefix
  end
end
