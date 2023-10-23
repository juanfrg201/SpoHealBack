class Api::V1::ActiveDaysController < ApplicationController
  def index
    start_week, end_week = start_end_week
    active_days = User.find(params[:user_id]).active_days.where(start_week: start_week, end_week: end_week)
    if active_days.present?
      sorted_days = active_days.sort_by { |day| ActiveDay.days[day.day] }
      render json: { days: sorted_days }, status: :ok
    else
      render json: { errors: active_days.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def create
    start_week, end_week = start_end_week
    day_number = (Date.today.wday + 6) % 7
    active_day = ActiveDay.new(user_id: create_params[:user_id].to_i, day: day_number, start_week: start_week, end_week: end_week)
    if active_day.validate_register
      if active_day.save 
        render json: { mensage: "se creo" }, status: :ok
      else
        render json: { errors: active_day.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { errors: active_day.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private 

  def create_params 
    params.permit(:user_id)
  end

  def start_end_week
    today = Date.today

    # Obtenemos el inicio de la semana (lunes)
    start_of_week = today - today.wday + 1

    # Obtenemos el final de la semana (domingo)
    end_of_week = start_of_week + 6

    return [start_of_week, end_of_week]
  end
end
