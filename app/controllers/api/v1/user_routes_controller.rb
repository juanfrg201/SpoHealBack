class Api::V1::UserRoutesController < ApplicationController
  def create
    user_route = UserRoute.new(create_params)
    if user_route.save
      render json: { message: "Se creo" }, status: :ok
    else
      render json: { errors: user_route.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def index
    routes = User.find(params[:user_id]).user_routes
    if routes.present?
      render json: { routes: routes }, status: :ok
    else 
      render json: { message: "No se encontraron rutas" }, status: :ok
    end

  end

  private 

  def create_params 
    params.permit(:user_id, :route_id)
  end

end
