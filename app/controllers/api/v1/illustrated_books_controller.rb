class Api::V1::IllustratedBooksController < ApplicationController
  skip_before_action :authenticate, only: %i[index show]

  def index
    illustrated_books = IllustratedBook.all
    json_string = IllustratedBookSerializer.new(illustrated_books).serializable_hash.to_json
    render json: json_string
  end

  def show
    options = { include: %i[user 'user.name' 'user.email'] }
    json_string = IllustratedBookSerializer.new(@illustrated_book, options).serializable_hash.to_json
    render json: json_string
  end


  private

  def set_illustrated_book
    @illustrated_book = IllustratedBook.find(params[:id])
  end

  def illustrated_book_params
    params.require(:illustrated_book).permit(:title).merge(user_id: current_user.id)
  end
end
