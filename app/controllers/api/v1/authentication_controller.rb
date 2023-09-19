class Api::V1::AuthenticationController < ApplicationController
  before_action :authenticate

  def authenticate
    user = User.find_by(email: params[:email])

    if user && user.authenticate_user(params[:password])
      auth_token = JsonWebToken.encode(user_id: user.id)
      render json: { auth_token: auth_token }, status: :ok
    else
      render json: { error: 'Correo electrónico o contraseña incorrecta' }, status: :unauthorized
    end
  end

  def current_user
    render json: @current_user
  end

end
