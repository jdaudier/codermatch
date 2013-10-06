Codermatch::Application.routes.draw do

  # root :to => 'pages#alt'

  root :to => 'pages#alt'
  post '/signup' => 'pages#signup'
  post 'users/notify' => 'users#notify'

  post '/remotable' => 'coder_searches#make_remotable'

  post '/remotable_notification' => 'coder_searches#remote_pair_notification'

  post '/both_results_remote' => 'coder_searches#both_results_remote'

  post '/send_pair_request' => 'contact#send_pair_request'

  resource :coder_search
  resources :languages
  resources :levels
  resources :users
  # get 'users/', to: user#index
  # get 'users/:id', to: user#show
  # get 'users/new', to: user#new
  # post 'users/create', to: user#create
  # get 'users/edit', to: user#edit
  # put 'users/:id', to: user#update
  # delete 'users/:id', to: user#delete



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

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
