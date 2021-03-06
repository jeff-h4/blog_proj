Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root 'home#index'
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  get '/home'  => 'home#index'
  get '/about' => 'home#about'
  #### get '/posts/new' => 'posts#new', as: :new_post
  #### post '/posts' => 'posts#create'
  #### get '/posts' => 'posts#index'
  #### get '/posts/:id' => 'posts#show', as: :post
  #### get '/posts/:id/edit' => 'posts#edit', as: :edit_post
  #### patch '/posts/:id' => 'posts#update'
  #### delete '/posts/:id' => 'posts#destroy'
  resources :posts do
    resources :comments, only: [:create, :destroy]
    resources :favourites, only: [:create, :destroy]
  end

  #resources :users, only: [:new, :create]
  # The following would add edit and update views/actions
  # But the User ID would get exposed in the URLs, which is bad practice
  #resources :users, only: [:new, :create, :edit, :update]
  # The better way is below:
  resources :users, only: [:new, :create] do
    # on: :collection means the resource is not nested.
    # It does not include the user :id in the URL
    get   :edit,   on: :collection 
    patch :update, on: :collection
  end
  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

  #For Delayed job Web Interface
  match "/delayed_job" => DelayedJobWeb, :anchor => false, via: [:get, :post]


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
