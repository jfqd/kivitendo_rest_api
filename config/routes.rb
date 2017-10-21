Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    # version 1 of our api
    namespace :v1, defaults: {format: 'xml'} do
      resources :customers
      resources :tax_zones
      resources :currencies
      resources :orders
    end
    # version 2 of our api
  end
  
end
