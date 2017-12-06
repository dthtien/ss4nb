Rails.application.routes.draw do
  root "cameras#index"
  resources :cameras, only: [:index, :show]
  get 'analyze', to: 'home#analyze'
end
