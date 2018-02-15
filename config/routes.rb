Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'


  root 'teams#stats'

  get 'contact_form/new'
  get 'contact_form/create'
  get 'about' => 'pokemonsets#about', as: 'about'
  
  match '/contacts',     to: 'contacts#new',             via: 'get'
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  
  get '/recursos/new/:id' => 'players#recursos_new', as: 'recursos'
  get '/recursos/create' => 'players#recursos_create', as: 'recursos_create'
  get '/vgc15' => 'pokemonsets#VGC15'
  get '/vgc16'=> 'pokemonsets#VGC16'
  
  get '/teams/filter' => 'teams#filter_pokemon'
  get '/teams/new_single' => 'teams#new_single'
  get '/teams/create_single' => 'teams#create_single' 
  get '/teams/stats' => 'teams#stats'
  get '/teams/edit/:id' => 'teams#edit'
  get '/teams/edit_top/:id' => 'teams#edit_top'
  get 'teams/index' => 'teams#index'
  get 'teams/new'
  get 'teams/create'
  get '/teams' => 'teams#index'
  get '/teams/show/:id' => 'teams#show', as: 'id'
  get '/top/new' => 'teams#create_top'
  patch '/update_top/:id' => 'teams#update_top'
  get '/faq' => 'contacts#faq'
  
  resources :players
  resources "contacts", only: [:new, :create]
  resources :pokemons
  resources :tops
  resources :teams
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
