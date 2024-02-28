require 'sidekiq/web'

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :user_movies, only: [:create, :update]

  resources :movies, only: [:index, :new, :create] do
    collection do
      get 'upload', to: 'movies#upload' # rota para acessar a página de upload
      get 'delete', to: 'movies#delete' # rota para acessar a página de delete
      get 'score', to: 'movies#score' # rota para acessar a página de enviar notas
      
      post 'import', to: 'movies#import' # rota para processar o upload de filmes
      post 'exclude', to: 'movies#exclude' # rota para excluir filmes
      post 'submit_score', to: 'movies#submit_score' # rota para processar o upload de notas
    end
  end

  mount Sidekiq::Web => '/sidekiq'

  get '/login', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'

  root 'sessions#new'
end
