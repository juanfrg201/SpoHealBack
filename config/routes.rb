Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :recommendations, only: [:index]
      resources :cardiovascular_deseases, only: [:index]
      resources :activities, only: [:index]
      resources :user_parameterizations, only: [:create]
      resources :users, only: [:create]
      resources :authenticate, only: [:authenticate]
      resources :community_posts, only: [:show, :create]  
      get 'show_related_posts', to: 'community_posts#show_related_posts'
      post 'authenticate', to: 'authentication#authenticate' # Utiliza 'post' para la acción de autenticación
    end
  end

end
