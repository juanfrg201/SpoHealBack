class ActiveDay < ApplicationRecord
  belongs_to :user

  enum day: {
    "lunes" => 0,
    "martes" => 1,
    "miércoles" => 2,  # Agregado una coma después del valor 2
    "jueves" => 3,
    "viernes" => 4,
    "sábado" => 5,  # Corregido a "sábado" y agregado una coma
    "domingo" => 6
  }

  def validate_register
    today = Date.today

    start_of_week = today - today.wday + 1

    end_of_week = start_of_week + 6

    # Corregir el uso de "self.user_id"
    ActiveDay.where(user_id: self.user_id, start_week: start_of_week, end_week: end_of_week, day: self.day).present? ? false : true
  end


end
