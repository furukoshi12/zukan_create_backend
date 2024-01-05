class Api::V1::FieldDesignsController < ApplicationController
  before_action :set_field_designs, only: %i[index]
  before_action :set_field_design, only: %i[show update destroy]

  def index
    render json: FieldDesignSerializer.new(@field_designs).serializable_hash.to_json
  end

  def show
    json_string = FieldDesignSerializer.new(@field_design).serializable_hash.to_json
    render json: json_string
  end

  def create
    field_design = FieldDesign.new(field_params)

    if field_design.save
      json_string = FieldDesignSerializer.new(field_design).serializable_hash.to_json
      render json: json_string
    else
      render_400(nil, field_design.errors.full_messages)
    end
  end

  def update
    if @field_design.update(field_params)
      json_string = FieldDesignSerializer.new(@field_design).serializable_hash.to_json
      render json: json_string
    else
      render_400(nil, @field_design.errors.full_messages)
    end
  end

  def destroy
    @field_design.destroy!
    set_field_designs
    json_string = FieldDesignSerializer.new(@field_designs).serializable_hash.to_json
    render json: json_string
  end

  private

  def set_field_designs
    @field_designs = FieldDesign.all
  end

  def set_field_design
    @field_design = FieldDesign.find(params[:id])
  end

  def field_params
    params.require(:field_design).permit(:label, :background_color, :color, :border_color, :border_style, :border_radius, :font_family, :font_size)
  end
end
