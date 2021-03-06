Rails.application.routes.draw do

  root 'home#index'

  get '/admin' => 'admin#index', as: :admin_index

  devise_for :users, :controllers => {:registrations => "registrations"}

  get '/admin/pays' => 'countries#index_admin', as: :country_admin_index
  get '/admin/pays/new' => 'countries#new', as: :country_new
  post '/admin/pays/create' => 'countries#create', as: :country_create
  patch '/admin/pays/update/:id' => 'countries#update', as: :country_update
  get '/admin/pays/edit/:id' => 'countries#edit', as: :country_edit
  delete '/admin/pays/delete/:id' => 'countries#destroy', as: :country_delete

  # user management
  get '/admin/utilisateurs' => 'admin#users_index', as: :users_admin_index
  get '/admin/utilisateurs/download' => 'admin#users_download', as: :users_download

  # matches management
  get '/admin/matches' => 'match#index_admin', as: :match_admin
  get '/admin/match/new' => 'match#new', as: :match_new
  get '/matchs/' => 'match#index', as: :match
  post '/admin/match/create' => 'match#create', as: :match_create
  delete '/admin/match/delete/:id' => 'match#destroy', as: :match_delete
  get '/admin/match/edit/:id' => 'match#edit', as: :match_edit
  put '/admin/match/update/:id' => 'match#update', as: :match_update

  # Pools
  get '/admin/pools' => 'pool#index_admin', as: :pools_admin
  get '/admin/pool/new' => 'pool#new', as: :pool_new
  post '/admin/pool/create' => 'pool#create', as: :pool_create
  delete '/admin/pool/delete/:id' => 'pool#destroy', as: :pool_delete
  get '/admin/pool/edit/:id' => 'pool#edit', as: :pool_edit
  put '/admin/pool/update/:id' => 'pool#update', as: :pool_update

  # results management
  get '/results' => 'results#resultats'

  #stade management
  get '/admin/stades' => 'stade#index_admin', as: :stade_admin
  get '/admin/stade/new' => 'stade#new', as: :stade_new
  post 'admin/stade/create' => 'stade#create', as: :stade_create
  delete '/admin/stade/delete/:id' => 'stade#destroy', as: :stade_delete
  get '/admin/stade/edit/:id' => 'stade#edit', as: :stade_edit
  put '/admin/stade/update/:id' => 'stade#update', as: :stade_update

  # Prizes
  get '/admin/prizes' => 'prizes#index_admin', as: :prize_admin_index
  get '/admin/prizes/new' => 'prizes#new', as: :prize_new
  get '/prizes/' => 'prizes#index', as: :prize
  post '/admin/prizes/create' => 'prizes#create', as: :prize_create
  patch '/admin/prizes/update/:id' => 'prizes#update', as: :prize_update
  get '/admin/prizes/edit/:id' => 'prizes#edit', as: :prize_edit
  delete '/admin/prizes/delete/:id' => 'prizes#destroy', as: :prize_delete

  # Legales
  get '/legales/sitemap' => 'legales#sitemap', as: :sitemap
  get '/legales/reglement' => 'legales#rules', as: :rules

  # Rules
  #get 'reglement/' => 'rules#index', as: :rules

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
