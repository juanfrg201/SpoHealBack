module Services
  class Recommendation
    attr_accessor :user_id

    def initialize(user_id)
      @user_id = user_id
      @user_parameterization = User.find(user_id).user_parameterization
    end

    def perform
      content_based_recommendations = recommend_content_based
      collaborative_recommendations = recommend_collaborative

      combined_recommendations = (content_based_recommendations + collaborative_recommendations).uniq

      combined_recommendations.take(3)
    end

    private

    def recommend_content_based
      activity_type = @user_parameterization.activity.activity_type
      favorite_intensity = @user_parameterization.activity.intensity
      favorite_duration = @user_parameterization.activity.duration
      activities = (activity_type.activities + Activity.where(intensity: favorite_intensity) + Activity.where(duration: favorite_duration)).uniq


      sorted_activities = activities_with_fitness(activities).sort_by { |activity| -activity[:fitness_score] }

      content_based_recommendations = sorted_activities.map { |activity| activity[:activity] }

      content_based_recommendations
    end

    def recommend_collaborative
      recommender = Disco::Recommender.new
      data = ActivityRecommendation.all.map{ |a| {item_id: a.id, user_id: a.user_id, activity_id: a.activity_id, rating: ActivityRecommendation.ratings[a.rating]}}
      recommender.fit(data)
      recommender_data = recommender.user_recs(@user_id)
      activities = []
      recommender_data.each do |data|
        activities << ActivityRecommendation.find(data[:item_id]).activity
      end

      activities_with_fitness(activities)

      sorted_activities = activities_with_fitness(activities).sort_by { |activity| -activity[:fitness_score] }

      collaborative_recommendations = sorted_activities.map { |activity| activity[:activity] }

      collaborative_recommendations
    end

    def activities_with_fitness(activities)
      activities_with_fitness = activities.map do |activity|
        fitness_score = calculate_fitness_score(@user_parameterization.weight, @user_parameterization.height, @user_parameterization.imc, activity)
        { activity: activity, fitness_score: fitness_score }
      end
      activities_with_fitness
    end

    def calculate_fitness_score(weight, height, ibm, activity)
      activity_intensity = Activity.intensities[activity.intensity]
      activity_duration = activity.duration

      fitness_score = (ibm.to_i * 0.4) + (activity_intensity * 0.3) + (activity_duration * 0.3)

      fitness_score
    end
  end
end