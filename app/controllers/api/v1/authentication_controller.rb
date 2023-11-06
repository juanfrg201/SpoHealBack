class Api::V1::AuthenticationController < ApplicationController

  def authenticate
    user = User.find_by(email: params[:email])

    if user && user.authenticate_user(params[:password])
      render json: { user_id: user.id }, status: :ok
    else
      render json: { error: 'Correo electrónico o contraseña incorrecta' }, status: :unauthorized
    end
  end

end
