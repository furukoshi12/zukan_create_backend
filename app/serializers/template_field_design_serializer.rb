class TemplateFieldDesignSerializer
  include JSONAPI::Serializer
  attributes :x_position, :y_position
  
  belongs_to :template
  belongs_to :field_design
end
