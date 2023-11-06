class Api::V1::UsersController < ApplicationController

  def create
    user = User.new(user_params)

    if user.save
      auth_token = JsonWebToken.encode(user_id: user.id)
      user.update(auth_token: auth_token)
      render json: { user_id: user.id }, status: :ok
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private 

  def user_params
    params.require(:user).permit(:name, :last_name, :email, :password, :number_phone)
  end

  def update_params 
    params.require(:user).permit(:name, :last_name, :email, :password, :password_confirmation, :authentication_token)
  end

end
