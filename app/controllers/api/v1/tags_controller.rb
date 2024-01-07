class Api::V1::TagsController < ApplicationController
  before_action :set_tags, only: %i[index]

  def index
    json_string = TagSerializer.new(@tags).serializable_hash.to_json
    render json: json_string
  end

  def destroy
    @tag = Tag.find(params[:id])
    if @tag.destroy
      set_tags
      json_string = TagSerializer.new(@tags).serializable_hash.to_json
      render json: json_string
    else
      render_400(nil, @tag.errors.full_messages)
    end
  end

  private

  def set_tags
    @tags = Tag.all
  end
end
