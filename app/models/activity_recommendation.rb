

class ActivityRecommendation < ApplicationRecord
  belongs_to :user
  belongs_to :activity


  def similarity_activities

    user_parametizer = user.user_parameterization
    activity_type = user_parametizer.activity.activity_type
    activities = activity_type.activities

    activities

  end

end
