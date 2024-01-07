class Api::V1::IllustratedBooksController < ApplicationController
  skip_before_action :authenticate, only: %i[index show]
  before_action :set_illustrated_books, only: %i{index}
  before_action :set_illustrated_book, only: %i[show]

  def index
    if params[:search].present?
      search_term = "%#{params[:search]}%"
      @illustrated_books = IllustratedBook.includes(:tags).where("illustrated_books.title LIKE ? OR tags.name LIKE ?", search_term, search_term).references(:tags).order('illustrated_books.created_at DESC')
    end
    json_string = IllustratedBookSerializer.new(@illustrated_books).serializable_hash.to_json
    render json: json_string
  end

  def show
    json_string = IllustratedBookSerializer.new(@illustrated_book).serializable_hash.to_json
    render json: json_string
  end
  
  private
  def set_illustrated_books
    @illustrated_books = IllustratedBook.all.order('created_at DESC')
  end

  def set_illustrated_book
    @illustrated_book = IllustratedBook.find(params[:id])
  end
end
