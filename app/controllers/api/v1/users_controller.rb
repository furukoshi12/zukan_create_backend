class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]

  def index
    @users = User.all
    render json: @users
  end

  def show
    render json: @user
  end

  def update
    if @user.update(user_params)
      render json: @user
    else
      render_400(nil, @user.errors.full_messages)
    end
  end

  def destroy
    if @user.destroy
      render json: @user
    else
      render_400(nil, @user.errors.full_messages)
    end
  end

  private

  def set_user
    @user = User.find_by_id(params[:id])
  end
end
