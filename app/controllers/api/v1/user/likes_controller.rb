class Api::V1::User::LikesController < ApplicationController

  def index
    likes = current_user.like_illustrated_books
    json_string = IllustratedBookSerializer.new(likes).serializable_hash.to_json
    render json: json_string
  end

  def show
    illustrated_book_id = params[:id]
    like = current_user.likes.find_by(illustrated_book_id: illustrated_book_id)
    if like
      render json: {likeExists: true}
    else
      render json: {likeExists: false}
    end
  end

  def create
    illustrated_book_id = params[:illustrated_book_id]
    like = current_user.likes.find_by(illustrated_book_id: illustrated_book_id)
    if like
      like.destroy
      render json: {status: 'ok'}
    else
      like = current_user.likes.create(illustrated_book_id: illustrated_book_id)
      json_string = IllustratedBookSerializer.new(like.illustrated_book).serializable_hash.to_json
      render json: json_string
    end
  end
end
