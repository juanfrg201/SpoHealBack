class Api::V1::UserParameterizationsController < ApplicationController
  def create
    puts "**********"
    puts user_parameterization_params[:auth_token]
    user = User.find(user_parameterization_params[:auth_token]) 

    user_parameterization = UserParameterization.new(user_id: user.id, activity_id: Activity.last.id, cardiovascular_desease_id: CardiovascularDesease.last.id, age: user_parameterization_params[:age], weight: user_parameterization_params[:weight], height: user_parameterization_params[:height], sport_medical_restriccion: user_parameterization_params[:sportMedicalRestriction], sport_muscle_pains: user_parameterization_params[:sportMusclePains], general_pain: user_parameterization_params[:generalPain], is_hipertension: user_parameterization_params[:isHypertension], is_asthma: user_parameterization_params[:isAsthma], is_chest_pain: user_parameterization_params[:isChestPain], pain_cardiac: user_parameterization_params[:painCardiac], cardiac_family_pain: user_parameterization_params[:cardiacFamilyPain], cholesterol_pain: user_parameterization_params[:cholesterolPain], dizzines_pain: user_parameterization_params[:dizzinessPain], smoke_pain: user_parameterization_params[:smokePain], covid_19: user_parameterization_params[:covid19])

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
    params.permit(:auth_token,:favorite_activity_name, :select_cardiovascular_deseases, :age, :weight, :height, :sportMedicalRestriction,
    :sportMusclePains,
    :generalPain,
    :isHypertension,
    :isAsthma,
    :isChestPain,
    :painCardiac,
    :cardiacFamilyPain,
    :cholesterolPain,
    :dizzinessPain,
    :smokePain,
    :covid19)
  end
end
