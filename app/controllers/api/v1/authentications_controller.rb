class Api::V1::AuthenticationsController < ApplicationController
  skip_before_action :authenticate

  def signup
    @user = User.new(user_params)

    if @user.save
      json_string = UserSerializer.new(@user).serializable_hash.to_json
      set_access_token!(@user)
      render json: json_string
    else
      render_400(nil, @user.errors.full_messages)
    end
  end

  def login
    @user = login(params[:email], params[:password])

    render_400(nil, @user.errors.full_messages) unless @user

    json_string = UserSerializer.new(@user).serializable_hash.to_json
    set_access_token!(@user)
    render json: json_string
  end

  def guest_login
    @guest_user = User.create(
      name: 'guest',
      email: SecureRandom.alphanumeric(10) + "@example.com",
      password: 'password',
      password_confirmation: 'password'
    )
    if @guest_user.persisted?
      auto_login(@guest_user)
      json_string = UserSerializer.new(@guest_user).serializable_hash.to_json
      set_access_token!(@guest_user)
      render json: json_string
    else
      render_400(nil, @guest_user.errors.full_messages)
    end
  end

  def logout
    logout
    render json: { message: 'Logged out' }
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name)
  end
end
