Rails.application.routes.draw do
  devise_for :users
  resources :restaurants
  resources :menu_items
  resources :ratings
  resources :orders, :except => [:new, :create]


  resources :users do 
    get 'restaurants' => 'restaurants#my_restaurants'
    get 'restaurants' => 'restaurants#my_restaurant'
    resources :restaurants, except: [:index, :show] do
      resources :menu_items, except: [:index]
      get 'menu_items' => 'restaurants#my_menu'
      get 'restaurants' => 'restaurants#my_menu'
      resources :orders, except: [:index]
      get 'orders' => 'orders#my_orders'
    end
  end


  get 'users/:user_id/restaurants/:id' => 'restaurants#my_restaurant', as: :my_restaurant

  post 'new/:restaurant_id' => 'orders#create', as: :create_order



  get 'new/:restaurant_id' => 'orders#new', as: :new_order

  resources :users

  get 'menu/:id' => 'restaurants#menu', as: :menu

  post 'menu/:id' => 'restaurants#submit_menu', as: :submit_menu

  get 'about' => 'about#index', :as => :about_us

  root 'restaurants#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
