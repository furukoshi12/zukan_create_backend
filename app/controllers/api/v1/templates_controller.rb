class Api::V1::TemplatesController < ApplicationController
  def index
    @templates = Template.all
    json_string = TemplateSerializer.new(@templates, options).serializable_hash.to_json
    render json: json_string
  end

  def create
    template = Template.new(template_params)

    if template.save
      json_string = TemplateSerializer.new(template).serializable_hash.to_json
      render json: json_string
    else
      render_400(nil, template.errors.full_messages)
    end
  end

  def update
  end

  def destroy
  end

  private

  def template_params
    params.require(:template).permit(:name, template_field_designs_attributes: [:field_design_id, :x_position, :y_position])
  end

  def options
    options = {}
    options[:include] = [:template_field_designs, :field_designs]
    options
  end

end
