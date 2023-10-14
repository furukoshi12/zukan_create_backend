class Api::V1::IllustratedBooksController < ApplicationController
  skip_before_action :authenticate, only: %i[index show]
  before_action :set_illustrated_book, only: %i[show]

  def index
    illustrated_books = IllustratedBook.all
    json_string = IllustratedBookSerializer.new(illustrated_books).serializable_hash.to_json
    render json: json_string
  end

  def show
    json_string = IllustratedBookSerializer.new(@illustrated_book, options).serializable_hash.to_json
    render json: json_string
  end
  
  private

  def set_illustrated_book
    @illustrated_book = IllustratedBook.find(params[:id])
  end

  def options
    options = {}
    options[:include] = [:user]
    options
  end
end
