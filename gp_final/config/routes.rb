Rails.application.routes.draw do
  devise_for :users
  resources :ratings
  resources :restaurants
  resources :orders, :except => [:new]

  get 'new/:restaurant_id' => 'orders#new', as: :new_order


  resources :users

  get 'menu/:restaurant_id' => 'restaurants#menu', as: :menu

  get 'about' => 'about#index', :as => :about_us

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
