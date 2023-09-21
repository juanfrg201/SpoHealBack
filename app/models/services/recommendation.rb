module Services
	class Recommendation
		attr_accessor :user_id
	
		validates :user_id, presence: true
	
		def initialize(args = {})
			@user_id = args[:user_id]
		end
	
		def perform
			return nil unless valid?
		
			content_based_recommendations = recommend_content_based(user_id)
			collaborative_recommendations = recommend_collaborative(user_id)
		
			# Combinar las recomendaciones de ambos enfoques (puedes ajustar cómo combinarlas).
			combined_recommendations = (content_based_recommendations + collaborative_recommendations).uniq
		
			combined_recommendations.take(5) # Limitar a 5 recomendaciones
		end
	
		private
	
		def recommend_content_based(user_id)
			user = User.find(user_id)
	
			user_parametizer = user.user_parameterization
      activity_type = user_parametizer.activity.activity_type
      favorite_intensity = user_parametizer.activity.intensity
      favorite_duration = user_parametizer.activity.duration
      activities = (activity_type.activities + Activity.where(intensity: favorite_intensity) + Activity.where(duration: favorite_duration)).uniq
		
			activities_with_fitness = activities.map do |activity|
				fitness_score = calculate_fitness_score(user_parametizer.weight, user_parametizer.height, user_parametizer.imc , activity)
				{ activity: activity, fitness_score: fitness_score }
			end
	
			sorted_activities = activities_with_fitness.sort_by { |activity| -activity[:fitness_score] }
		
			content_based_recommendations = sorted_activities.map { |activity| activity[:activity] }
		
			content_based_recommendations.first(3)
		end

    def recommendation_colaborative()
    end
	
		def calculate_fitness_score(weight, height, ibm , activity)
      activity_intensity = Activity.intensities[activity.intensity]
      activity_duration = activity.duration
    
      fitness_score = (ibm.to_i * 0.4) + (activity_intensity * 0.3) + (activity_duration * 0.3)
    
      fitness_score
    end

	end
end