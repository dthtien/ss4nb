require 'sidekiq/web'

Rails.application.routes.draw do
  get 'clustering/brand', to: 'clustering#clustering'

  get 'clustering/score', to: 'clustering#clustering'

  root "cameras#index"
  resources :cameras, only: [:index, :show]

  resources :scrapers, only: [:new, :create]
  
  get 'analyze', to: 'home#analyze'

  mount Sidekiq::Web, at: '/sidekiq'
end
