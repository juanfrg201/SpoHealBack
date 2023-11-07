class Api::V1::ActiveDaysController < ApplicationController
  def index
    start_week, end_week = start_end_week
    active_days = User.find(create_params[:auth_token]).active_days.where(start_week: start_week, end_week: end_week)
    day_number = (Date.today.wday + 6) % 7
    if active_days.present? && day_value == day_number
      day_value = active_days.days[active_days.where(user_id: User.find(create_params[:auth_token]).id).last.day]
      if day_value == day_number
        sorted_days = active_days.sort_by { |day| ActiveDay.days[day.day] }
        render json: { days: sorted_days }, status: :ok
      end
    else
      start_week, end_week = start_end_week
      day_number = (Date.today.wday + 6) % 7
      user = User.find(create_params[:auth_token])
      active_day = ActiveDay.new(user_id: user.id, day: day_number, start_week: start_week, end_week: end_week)
      if active_day.validate_register
        if active_day.save 
          active_days = User.find(create_params[:auth_token]).active_days.where(start_week: start_week, end_week: end_week)
          sorted_days = active_days.sort_by { |day| ActiveDay.days[day.day] }
          render json: { days: sorted_days }, status: :ok
        else
          render json: { errors: active_day.errors.full_messages }, status: :unprocessable_entity
        end
      else
        render json: { mensage: "Ya se le registro el dia" }, status: :ok
      end
    end
  end


  private 

  def create_params 
    params.permit(:auth_token)
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
