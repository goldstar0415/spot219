Rails.application.routes.draw do



  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  post '/rate' => 'rater#create', :as => 'rate'
  resources :cities do
    post :location, on: :collection
  end
  resources :shopping_carts do
    collection do
      get :paypal_callback
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

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
