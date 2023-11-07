class Api::V1::TagsController < ApplicationController
  def index
    @tags = Tag.all
    json_string =TagSerializer.new(@tags).serializable_hash.to_json
    render json: json_string
  end
end
