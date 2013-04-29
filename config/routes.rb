WsReturn::Application.routes.draw do

  resources :events

  get "home/index"

  devise_for :users

  resources :promos


  resources :schools

  resources :votes

  match '/score/voteArticle' => "scores#voteArticle", :via => :post
  match '/score/unvoteArticle' => "scores#unvoteArticle", :via => :post

  match '/score/voteAcomment' => "scores#voteAcomment", :via => :post
  match '/score/unvoteAcomment' => "scores#unvoteAcomment", :via => :post

  match '/score/voteGossip' => "scores#voteGossip", :via => :post
  match '/score/voteAgainstGossip' => "scores#voteAgainstGossip", :via => :post
  match '/score/unvoteGossip' => "scores#unvoteGossip", :via => :post

  resources :scores

  
  resources :gossips do
    resources :gcomments
  end


  resources :authors


  resources :tags
  resources :articles do
    resources :acomments
  end

  match '/articles/delete/:id' => "articles#pdestroy", :via => :post
  match '/articles/filterbylogin/:login' => "articles#filterbylogin", :via => :post
  match '/articles/:id/acomments/delete/:id' => "acomments#pdestroy", :via => :post
  match '/events/:id/update' => "events#pupdate", :via => :post

  resources :jobs

  

  match '/groups/:id/savemember' => "groups#savemember", :via => :post
  
  resources :groups


  resources :users

  resources :api_session

  root :to => "home#index"
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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
