class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]
  skip_before_action :authenticate, only: %i[create]

  def index
    @users = User.all
    render json: @users
  end

  def create
    @user = User.new(user_params)

    if @user.save
      json_string = UserSerializer.new(@user).serializable_hash.to_json
      set_access_token!(@user)
      render json: json_string
    else
      render_400(nil, @user.errors.full_messages)
    end
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
