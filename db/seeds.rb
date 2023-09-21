# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
UserParameterization.all.destroy_all
Activity.destroy_all
ActivityType.destroy_all
CardiovascularDesease.destroy_all
User.all.destroy_all

10.times do |i|
    User.create(
        name: "Usuario#{i + 1}",
        last_name: "Apellido#{i + 1}",
        email: "usuario#{i + 1}@example.com",
        password: "password#{i + 1}",
        number_phone: "123456789#{i + 1}"
    )
end

# Crear registros de tipos de ejercicios
cardio_type = ActivityType.create(
  name: "Cardio",
  description: "Ejercicios de alta intensidad para mejorar la resistencia cardiovascular.",
  benefits: "Aumenta la capacidad cardiorrespiratoria y quema calorías."
)

strength_type = ActivityType.create(
  name: "Fuerza",
  description: "Ejercicios con pesas y resistencia para fortalecer los músculos.",
  benefits: "Aumenta la masa muscular y la fuerza."
)

yoga_type = ActivityType.create(
  name: "Yoga",
  description: "Práctica de ejercicios de estiramiento y meditación para mejorar la flexibilidad y la relajación.",
  benefits: "Aumenta la flexibilidad, reduce el estrés y mejora la postura."
)

# Crear ejercicios por categoría de tipo
Activity.create(
  activity_type: cardio_type,
  name: "Correr",
  description: "Correr a alta velocidad durante un período de tiempo específico.",
  tutorial: "Enlace al tutorial de correr",
  benefits: "Mejora la resistencia cardiovascular y quema calorías.",
  identifier: 101,
  intensity: "Alta", # Ajusta la intensidad según corresponda
  duration: 30 # Ajusta la duración en minutos
)

Activity.create(
  activity_type: cardio_type,
  name: "Ciclismo",
  description: "Andar en bicicleta a alta velocidad en terreno plano o montañoso.",
  tutorial: "Enlace al tutorial de ciclismo",
  benefits: "Mejora la resistencia cardiovascular y fortalece las piernas.",
  identifier: 102,
  intensity: "Media", # Ajusta la intensidad según corresponda
  duration: 45 # Ajusta la duración en minutos
)

Activity.create(
  activity_type: cardio_type,
  name: "Saltar la cuerda",
  description: "Saltar la cuerda de manera continua a alta intensidad.",
  tutorial: "Enlace al tutorial de saltar la cuerda",
  benefits: "Mejora la coordinación y quema calorías rápidamente.",
  identifier: 103,
  intensity: "Alta", # Ajusta la intensidad según corresponda
  duration: 20 # Ajusta la duración en minutos
)

Activity.create(
  activity_type: strength_type,
  name: "Levantamiento de pesas",
  description: "Levantamiento de pesas con mancuernas o barras para fortalecer los músculos.",
  tutorial: "Enlace al tutorial de levantamiento de pesas",
  benefits: "Aumenta la masa muscular y la fuerza.",
  identifier: 104,
  intensity: "Alta", # Ajusta la intensidad según corresponda
  duration: 45 # Ajusta la duración en minutos
)

Activity.create(
  activity_type: strength_type,
  name: "Flexiones",
  description: "Ejercicio que implica flexionar los brazos para fortalecer el pecho y los tríceps.",
  tutorial: "Enlace al tutorial de flexiones",
  benefits: "Fortalece el pecho, los tríceps y los hombros.",
  identifier: 105,
  intensity: "Media", # Ajusta la intensidad según corresponda
  duration: 20 # Ajusta la duración en minutos
)

Activity.create(
  activity_type: yoga_type,
  name: "Postura del perro boca abajo (Downward Dog)",
  description: "Postura de yoga que estira todo el cuerpo y mejora la flexibilidad.",
  tutorial: "Enlace al tutorial de Downward Dog",
  benefits: "Mejora la flexibilidad y alivia el estrés.",
  identifier: 106,
  intensity: "Baja", # Ajusta la intensidad según corresponda
  duration: 30 # Ajusta la duración en minutos
)

Activity.create(
  activity_type: yoga_type,
  name: "Savasana (Postura del cadáver)",
  description: "Postura de relajación final en yoga para la meditación y la relajación profunda.",
  tutorial: "Enlace al tutorial de Savasana",
  benefits: "Reduce el estrés y promueve la relajación total.",
  identifier: 107,
  intensity: "Baja", # Ajusta la intensidad según corresponda
  duration: 15 # Ajusta la duración en minutos
)
Activity.create(
  activity_type: cardio_type,
  name: "Natación",
  description: "Nadar en una piscina durante un período de tiempo.",
  tutorial: "Enlace al tutorial de natación",
  benefits: "Mejora la resistencia cardiovascular y fortalece todo el cuerpo.",
  identifier: 108,
  intensity: "Media",
  duration: 40
)

Activity.create(
  activity_type: cardio_type,
  name: "Escalada",
  description: "Subir montañas o paredes de escalada.",
  tutorial: "Enlace al tutorial de escalada",
  benefits: "Mejora la fuerza y la resistencia, además de ofrecer una experiencia emocionante.",
  identifier: 109,
  intensity: "Alta",
  duration: 60
)

CardiovascularDesease.create(
    name: "Hipertensión",
    description: "Aumento sostenido de la presión arterial en las arterias.",
    risk: 4,
    identifier: 101
)

CardiovascularDesease.create(
    name: "Infarto de miocardio",
    description: "Daño al músculo del corazón debido a la falta de flujo sanguíneo.",
    risk: 5,
    identifier: 102
)

CardiovascularDesease.create(
    name: "Insuficiencia cardíaca",
    description: "Incapacidad del corazón para bombear suficiente sangre para satisfacer las necesidades del cuerpo.",
    risk: 4,
    identifier: 103
)

CardiovascularDesease.create(
    name: "Aterosclerosis",
    description: "Acumulación de placa en las arterias que reduce el flujo sanguíneo.",
    risk: 3,
    identifier: 104
)

CardiovascularDesease.create(
    name: "Arritmia cardíaca",
    description: "Alteración en el ritmo normal del corazón.",
    risk: 2,
    identifier: 105
)


User.all.each do |i|
    user = User.find_by(id: i.id)
    activity = Activity.find_by(identifier: rand(101..108))
    cardiovascular = CardiovascularDesease.find_by(identifier: rand(101..105))
    p = UserParameterization.create(user_id: user.id, activity_id: activity.id, cardiovascular_desease_id: cardiovascular.id, age: rand(18..30), weight: rand(60..80), height: rand(140..180))
    imc = p.calculate_imc
    p.update(imc: imc)
end

User.all.each do |i|
    3.times do |f|
        activity_id = Activity.all.pluck(:id).sample
        ActivityRecommendation.create(user_id: i.id, activity_id: activity_id, rating: rand(0..3))
    end
end


