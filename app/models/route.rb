class Route < ApplicationRecord
    has_many :user_routes

    enum preasure: {
        "Baja" => 0,
        "Media" => 1,
        "Alta" => 2
    }
    enum level: {
        "Baja" => 0,
        "Media" => 1
    }
end
