class Api::V1::ActivitiesController < ApplicationController
  def index
    activities = Activity.all
    if activities.present?
      activity_data = activities.map { |activity| { name: activity.name, identifier: activity.identifier } }
      render json: activity_data
    else
      render json: { error: 'No se encontraron actividades' }, status: :not_found
    end
  end

end
