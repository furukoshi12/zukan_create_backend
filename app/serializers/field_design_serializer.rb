class FieldDesignSerializer
  include JSONAPI::Serializer
  attributes :label, :background_color, :color, :border_color, :border_style, :border_radius, :font_family, :font_size

  has_many :template_field_designs, serializer: TemplateFieldDesignSerializer

  attribute :background_color do |object|
    object.remove_background_prefix
  end

  attribute :relation_templates do |object|
    object.template_field_designs.map do |template_field_design|
      {
        height: template_field_design.height,
        width: template_field_design.width,
        x_position: template_field_design.x_position,
        y_position: template_field_design.y_position
      }
    end
  end
end
