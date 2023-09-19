Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      resources :authenticate, only: [:authenticate]
      post 'authenticate', to: 'authentication#authenticate' # Utiliza 'post' para la acción de autenticación
    end
  end

end
