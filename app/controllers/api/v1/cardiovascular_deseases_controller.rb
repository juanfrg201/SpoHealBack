class Api::V1::CardiovascularDeseasesController < ApplicationController
  def index
    cardiovascular_desease = CardiovascularDesease.all
    if cardiovascular_desease.present?
      cardiovascular_desease_data = cardiovascular_desease.map { |cardiovascular_desease| { name: cardiovascular_desease.name, identifier: cardiovascular_desease.identifier } }
      render json: cardiovascular_desease_data
    else
      render json: { error: 'No se encontraron enfermedades' }, status: :not_found
    end
  end
end
