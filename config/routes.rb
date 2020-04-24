Rails.application.routes.draw do
  resources :matches
  resources :coaches
  resources :tournaments
  resources :players
  get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
