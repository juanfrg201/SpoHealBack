class Api::V1::UserParameterizationsController < ApplicationController
  def create
    user = User.find_by(auth_token: user_parameterization_params[:auth_token]) 
    favorite_activity_id = Activity.find_by(name: user_parameterization_params[:favorite_activity_name]).id
    cardiovascular_desease_id = CardiovascularDesease.find_by(name: user_parameterization_params[:cardiovascular_desease]).id

    user_parameterization = UserParameterization.new(user_id: user.id, activity_id: favorite_activity_id, cardiovascular_desease_id: cardiovascular_desease_id, age: user_parameterization_params[:age], weight: user_parameterization_params[:weight], height: user_parameterization_params[:height])

    if user_parameterization.save
      imc = user_parameterization.calculate_imc
      user_parameterization.update(imc: imc)
      render json: { message: "Parametrizacion correcta" }, status: :ok
    else
      render json: { errors: user_parameterization.errors.full_messages }, status: :unprocessable_entity
    end

  end

  private

  def user_parameterization_params 
    params.permit(:auth_token, :favorite_activity_name, :cardiovascular_desease, :age, :weight, :height)
  end
end
