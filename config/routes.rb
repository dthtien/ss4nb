Rails.application.routes.draw do
  get 'clustering/brand'

  get 'clustering/score'

  root "cameras#index"
  resources :cameras, only: [:index, :show]

  resources :scrapers, only: [:new, :create]
  
  get 'analyze', to: 'home#analyze'
end
