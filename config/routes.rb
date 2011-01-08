Rateyourroast::Application.routes.draw do

  get "user_cities/create"

  controller :sessions do 
      get    'login' => :new 
      post   'login' => :create 
      get    'logout' => :destroy
      delete 'logout' => :destroy
      get    'reset' => :reset_selection
      delete 'reset' => :reset_selection
  end

  controller :about do 
      get    'about' => :index 
  end

  controller :terms do 
      get    'terms' => :index 
  end

  controller :privacy do 
      get    'privacy' => :index 
  end

  controller :status do 
      get    'status' => :index 
      get    'denied' => :denied 
  end

  controller :find do 
      get    'find' => :index 
  end

  controller :rate do 
      get    'rate' => :index 
  end

  controller :user_cities do 
      post    'user_cities' => :create 
  end

  controller :user_locations do 
      post    'user_locations' => :create 
  end

  controller :user_dishes do 
      post    'user_dishes' => :create 
  end

  #resources :user_locations
  resources :user_rights
  resources :users

  get "find/index"

  get "search/index"

  resources :locations
  resources :location_descriptions
  resources :dishes
  resources :reviews

  resources :cities

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => "about#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
