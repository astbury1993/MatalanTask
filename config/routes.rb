Rails.application.routes.draw do
    
    # home page
    root 'welcome#index'
    
    # sessions
    post '/signin' => 'sessions#create'
    delete '/signout' => 'sessions#destroy'
    
    # post '/viewall' => 'articles#showall'
    
    # users
    get '/signup' => 'users#new'
    resources :users, only: [:create]
    
    post '/signup' => 'sessions#create'

    # articles for user
    get '/users/:id' => 'articles#index', as: 'articles_for_user'
    resources :articles, except: [:index]
    
    # articles for user
    get '/users' => 'users#index', as: 'bloggers'
    resources :users

    
    
    # comments
    resources :comments, only: [:create, :destroy]
    
    # subscriptions
    resources :subscribers, only: [:create]
    get '/unsubscribe' => 'subscribers#unsubscribe', as: 'unsubscribe'
    
    # The priority is based upon order of creation: first created -> highest priority.
    # See how all your routes lay out with "rake routes".
    
    # You can have the root of your site routed with "root"
    # root 'welcome#index'
    
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