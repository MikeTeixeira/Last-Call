Rails.application.routes.draw do
  devise_for :users
  resources :ratings
  resources :restaurants
  resources :orders
  resources :users
  resources :menu_items
  get 'about' => 'about#index', :as => :about_us

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
