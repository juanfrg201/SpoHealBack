class Api::V1::CommunityController < ApplicationController
  def index
    communities = Community.all
    if communities.present?
      render json: { communities: communities }, status: :ok
    else
      render json: { errors: communities.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def create
    community = Community.new(create_params)
    if community.save
      render json: { message: "Se creo" }, status: :ok
    else
      render json: { errors: community.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    community = Community.find(params[:id])
    if community.update(update_params)
      render json: { message: "Se actualizo" }, status: :ok
    else
      render json: { errors: community.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private 

  def create_params 
    params.require(:community).permit(:user_id, :name, :issue)
  end

  def update_params 
    params.permit(:name, :issue)
  end
end
