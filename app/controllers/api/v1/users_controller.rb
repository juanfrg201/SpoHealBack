class Api::V1::UsersController < ApplicationController

  def create
    user = User.new(user_params)

    if user.save
      auth_token = JsonWebToken.encode(user_id: user.id)
      user.update(auth_token: auth_token)
      render json: { auth_token: auth_token }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    user = User.find_by(authentication_token: update_params[:authentication_token]) 
    if user.present?
      user.update(name: update_params[:name], last_name: update_params[:last_name], email: update_params[:email])
    else
    end

  end 

  private 

  def user_params
    params.permit(:name, :last_name, :email, :password)
  end

  def update_params 
    params.require(:user).permit(:name, :last_name, :email, :password, :password_confirmation, :authentication_token)
  end

end
