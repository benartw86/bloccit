Rails.application.routes.draw do
 
  # we pass resources :posts to the resources :topics block. This nests the post routes under the topic routes.
  
  resources :topics do
  
  resources :posts, except: [:index]
 end
 
  resources :posts, only: [] do
    resources :comments, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]
    
    post '/up-vote' => 'votes#up_vote', as: :up_vote
    post '/down-vote' => 'votes#down_vote', as: :down_vote   #these new lines create POST route, the as: key value pairs stipulate the method names whch will be associated with the route
  end
  
  

  # we create routes for new and create actions. The only hash key will prevent Rails from creating unnecessary routes.
  resources :users, only: [:new, :create, :show]
  
  resources :sessions, only: [:new, :create, :destroy]
 
 get 'about' => 'welcome#about'  
 
  root 'welcome#index'  #allows us to desclare a default page the app laods when user navigates to home page URL, root takes a hash as an argument
  
end

# resources :posts we call the resources method and pass it a Symbol. 
#This instructs Rails to create post routes for creating, updating, viewing, and deleting instances of Post. 

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