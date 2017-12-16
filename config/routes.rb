Rails.application.routes.draw do
  get 'statistic/brand', to: 'statistic#statistic'

  get 'statistic/product', to: 'statistic#statistic'

  get 'clustering/cluste', to: 'clustering#cluste'
  root "cameras#index"
  resources :cameras, only: [:index, :show]

  resources :scrapers, only: [:new, :create]
  
  get 'analyze', to: 'home#analyze'
end
