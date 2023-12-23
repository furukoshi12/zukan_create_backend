class Api::V1::TemplatesController < ApplicationController
  before_action :set_templates, only: %i[index]
  before_action :set_template, only: %i[show update destroy]

  def index
    render json: TemplateSerializer.new(@templates, options).serializable_hash.to_json
  end

  def show
    render json: TemplateSerializer.new(@template, options).serializable_hash.to_json
  end

  def create
    template = Template.new(template_params)

    if template.save
      render json: TemplateSerializer.new(template, options).serializable_hash.to_json
    else
      render_400(nil, template.errors.full_messages)
    end
  end

  def update
    if @template.update(template_params)
      render json: TemplateSerializer.new(@template, options).serializable_hash.to_json
    else
      render_400(nil, @template.errors.full_messages)
    end
  end

  def destroy
    if @template.destroy
      set_templates
      render json: TemplateSerializer.new(@templates, options).serializable_hash.to_json
    else
      render_400(nil, @template.errors.full_messages)
    end
  end

  private

  def set_templates
    @templates = Template.all
  end

  def set_template
    @template = Template.find(params[:id])
  end

  def template_params
    params.require(:template).permit(:name, template_field_designs_attributes: [:field_design_id, :x_position, :y_position, :width, :height])
  end

  def options
    options = {}
    options[:include] = [:template_field_designs, :field_designs]
    options
  end
end
