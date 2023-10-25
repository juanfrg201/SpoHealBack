class Route < ApplicationRecord
    has_many :user_routes

    enum preasure: {
        "Presion Baja" => 0,
        "Presion Media" => 1,
        "Presion Alta" => 2
    }
    enum level: {
        "Nivel Baja" => 0,
        "Nivel Media" => 1
    }
end
