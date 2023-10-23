Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :recommendations, only: [:index]
      resources :cardiovascular_deseases, only: [:index]
      resources :activities, only: [:index]
      resources :user_parameterizations, only: [:create]
      resources :users, only: [:create]
      resources :authenticate, only: [:authenticate]
      resources :community_posts, only: [:index, :create]  
      resources :community, only: [:index, :create]  
      resources :active_days, only: [:index, :create] 
      resources :user_routes, only: [:create, :index] 
      get 'show_related_posts', to: 'community_posts#show_related_posts'
      post 'authenticate', to: 'authentication#authenticate' # Utiliza 'post' para la acción de autenticación
    end
  end

end
