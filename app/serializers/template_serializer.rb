class TemplateSerializer
  include JSONAPI::Serializer
  attributes :name

  has_many :template_field_designs, serializer: TemplateFieldDesignSerializer
  has_many :field_designs, serializer: FieldDesignSerializer
end
