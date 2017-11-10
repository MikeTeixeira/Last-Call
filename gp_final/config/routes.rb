Rails.application.routes.draw do
  devise_for :users


  resources :ratings
  resources :restaurants, :except => [:new]
  resources :orders, :except => [:new, :create]

  get 'new/:restaurant_id' => 'orders#new', as: :new_order

  post 'new/:restaurant_id' => 'orders#create', as: :create_order

  get 'restaurants/:restaurant_id' => 'restaurants#new'


  resources :users

  get 'menu/:restaurant_id' => 'restaurants#menu', as: :menu

  post 'menu/:restaurant_id' => 'restaurants#submit_menu', as: :submit_menu

  get 'about' => 'about#index', :as => :about_us

  root 'restaurants#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
