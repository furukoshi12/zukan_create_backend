class Api::V1::User::IllustratedBooksController < ApplicationController
  before_action :set_illustrated_books, only: %i[index]
  before_action :set_illustrated_book, only: %i[show update destroy]

  def index
    json_string = IllustratedBookSerializer.new(@illustrated_books).serializable_hash.to_json
    render json: json_string
  end

  def show
    json_string = IllustratedBookSerializer.new(@illustrated_book, options).serializable_hash.to_json
    render json: json_string
  end

  def create
    illustrated_book = current_user.illustrated_books.new(illustrated_book_params)
    tag_names = params[:tags].split(' ')

    if illustrated_book.save
      tag_names.each do |name|
        tag = Tag.find_or_create_by(name: name)
        illustrated_book.tags << tag
      end

      json_string = IllustratedBookSerializer.new(illustrated_book).serializable_hash.to_json
      render json: json_string
    else
      render_400(nil, illustrated_book.errors.full_messages)
    end
  end

  def update
    if @illustrated_book.update(illustrated_book_params)
      json_string = IllustratedBookSerializer.new(@illustrated_book).serializable_hash.to_json
      render json: json_string
    else
      render_400(nil, @illustrated_book.errors.full_messages)
    end
  end

  def destroy
    @illustrated_book.destroy!
    set_illustrated_books
    json_string = IllustratedBookSerializer.new(@illustrated_books).serializable_hash.to_json
    render json: json_string
  end

  private

  def set_illustrated_book
    @illustrated_book = current_user.illustrated_books.find(params[:id])
  end

  def set_illustrated_books
    @illustrated_books = current_user.illustrated_books
  end

  def illustrated_book_params
    params.require(:illustrated_book).permit(:title, :template_id, illustrated_book_field_designs_attributes: [:field_design_id, :content, :height, :width, :x_position, :y_position]).merge(user_id: current_user.id)
  end

  def options
    options = {}
    options[:include] = [:user]
    options
  end
end
