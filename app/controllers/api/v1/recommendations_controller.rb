class Api::V1::RecommendationsController < ApplicationController
  def index
    user = User.find(params[:user_id])
    recommendation_service = Services::Recommendation.new(user.id)
    if recommendation_service.present?
        recommendations = recommendation_service.perform
        if recommendations
          render json: { data: recommendations }, status: :ok
        end
    else
        render json: { error: 'No se encontraron recomendaciones' }, status: :not_found
    end
  end
end
