class Api::V1::FieldDesignsController < ApplicationController
  def index
    @field_designs = FieldDesign.all
    render json: FieldDesignSerializer.new(@field_designs).serializable_hash.to_json
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
  end

  def destroy
  end


  private

  def field_params
    params.require(:field_design).permit(:uuid, :label, :background_color, :color, :border_color, :border_style, :border_radius, :font_family, :font_size)
  end
end
