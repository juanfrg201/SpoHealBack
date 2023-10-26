class AddParametrizerVariablesToActivities < ActiveRecord::Migration[7.0]
  def change
    add_column :activities, :sport_medical_restriccion, :boolean, default: false
    add_column :activities, :sport_muscle_pains, :boolean, default: false
    add_column :activities, :general_pain, :boolean, default: false
    add_column :activities, :is_hipertension, :boolean, default: false
    add_column :activities, :is_asthma, :boolean, default: false
    add_column :activities, :is_chest_pain, :boolean, default: false
    add_column :activities, :pain_cardiac, :boolean, default: false
    add_column :activities, :cardiac_family_pain, :boolean, default: false
    add_column :activities, :cholesterol_pain, :boolean, default: false
    add_column :activities, :dizzines_pain, :boolean, default: false
    add_column :activities, :smoke_pain, :boolean, default: false
    add_column :activities, :covid_19, :boolean, default: false

    add_column :user_parameterizations, :sport_medical_restriccion, :boolean, default: false
    add_column :user_parameterizations, :sport_muscle_pains, :boolean, default: false
    add_column :user_parameterizations, :general_pain, :boolean, default: false
    add_column :user_parameterizations, :is_hipertension, :boolean, default: false
    add_column :user_parameterizations, :is_asthma, :boolean, default: false
    add_column :user_parameterizations, :is_chest_pain, :boolean, default: false
    add_column :user_parameterizations, :pain_cardiac, :boolean, default: false
    add_column :user_parameterizations, :cardiac_family_pain, :boolean, default: false
    add_column :user_parameterizations, :cholesterol_pain, :boolean, default: false
    add_column :user_parameterizations, :dizzines_pain, :boolean, default: false
    add_column :user_parameterizations, :smoke_pain, :boolean, default: false
    add_column :user_parameterizations, :covid_19, :boolean, default: false
  end
end
