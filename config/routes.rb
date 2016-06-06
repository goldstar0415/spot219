Rails.application.routes.draw do

  resources :conversations do
    resources :messages
  end

  resources :sliders
  resources :subscriptions, only: :index

  #
  # Shoppe admin interface
  #
  mount Shoppe::Engine => "/shoppe"

  #
  # Product browising
  #
  get "products", to: "products#index", :as => 'products'
  #get 'products' => 'products#categories', :as => 'catalogue'
  get 'products/filter' => 'products#filter', :as => 'product_filter'
  get 'products/:category_id' => 'products#index', :as => 'products_by_category'
  get 'products/:category_id/:product_id' => 'products#show', :as => 'product'
  post 'products/:category_id/:product_id/buy' => 'products#add_to_basket', :as => 'buy_product'

  #
  # Order status
  #
  get 'order/:token' => 'orders#status', :as => 'order_status'

  #
  # Basket
  #
  get 'carts' => 'orders#show', :as => 'carts'
  delete 'carts' => 'orders#destroy', :as => 'empty_basket'
  post 'carts/:order_item_id' => 'orders#change_item_quantity', :as => 'adjust_basket_item_quantity'
  delete 'carts/:order_item_id' => 'orders#change_item_quantity'
  delete 'carts/delete/:order_item_id' => 'orders#remove_item', :as => 'remove_basket_item'

  #
  # Checkout
  #
  match 'checkout' => 'orders#checkout', :as => 'checkout', :via => [:get, :patch]
  match 'checkout/delivery' => 'orders#change_delivery_service', :as => 'change_delivery_service', :via => [:post]
  match 'checkout/pay' => 'orders#payment', :as => 'checkout_payment', :via => [:get, :patch]
  match 'checkout/confirm' => 'orders#confirmation', :as => 'checkout_confirmation', :via => [:get, :patch]
  #
  # Paypal
  #
  get "checkout/paypal", to: "orders#paypal"
###################################################
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  post '/rate' => 'rater#create', :as => 'rate'
  resources :cities do
    post :location, on: :collection
  end
  resources :shopping_carts do
    collection do
      get :paypal_callback
      post :checkout
    end
    member do
      delete :remove_item
    end
  end
  resources :claims
  resources :places
  resources :blog_comments
  resources :blogs
  devise_for :users, :controllers => { :registrations => "user/registrations" }
  resources :users, only: [:show]
  resources :friendships
  get 'search_friends', to: 'users#search'
  post 'add_friend', to: 'users#add_friend'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root 'places#index'

  resources :categories, except: [:destroy]
  resources :comments

  resources :places do
    resources :comments
  end

  resources :blogs do
    resources :blog_comments
  end

  get 'search', to: "places#search"
  get 'my_profile', to: "users#my_profile"
  get 'my_friends', to: 'users#my_friends'
  get 'my-places', to: 'users#my_places'

  # Static pages
  #
  get ':action', :controller => 'pages', :as => 'page'
end
