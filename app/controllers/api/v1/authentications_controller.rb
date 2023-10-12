class Api::V1::AuthenticationsController < ApplicationController
  skip_before_action :authenticate, only: %i[create]

  def create
    @user = login(params[:email], params[:password])

    if @user
      access_token = @user.activate_api_key!.access_token
      json_string = UserSerializer.new(@user).serializable_hash.merge(access_token: access_token).to_json
      render json: json_string
    else
      render_400(nil, @user.errors.full_messages)
    end
  end

  def guest_login
    @guest_user = User.create(
      name: 'guest',
      email: SecureRandom.alphanumeric(10) + "@example.com",
      password: 'password',
      password_confirmation: 'password'
    )
    if @guest_user.persisted?
      access_token = @guest_user.activate_api_key!.access_token
      json_string = UserSerializer.new(@guest_user).serializable_hash.merge(access_token: access_token).to_json
      auto_login(@guest_user)
      render json: json_string
    else
      render_400(nil, @guest_user.errors.full_messages)
    end
  end

  def logout
    logout
    render json: { message: 'Logged out' }
  end
end
