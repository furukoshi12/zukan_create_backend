class Api::V1::LikesController < ApplicationController

  def create
    like = current_user.likes.create(illustrated_book_id: params[:illustrated_book_id])
    render json: like
  end

  def destroy
    illustrated_book = IllustratedBook.find(params[:illustrated_book_id])
    like = current_user.likes.find_by(illustrated_book_id: illustrated_book.id)
    like.destroy
    render json
  end
end
