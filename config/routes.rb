Rails.application.routes.draw do
  resources :players

  get 'teams/new'

  get 'teams/create'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'contact_form/new'

  get 'contact_form/create'
  get 'about' => 'pokemonsets#about', as: 'about'
  get 'pokemonsets/best' => 'pokemonsets#best' , as: 'best_pokemonset'
  get 'pokemonsets/search' => 'pokemonsets#search' , as: 'search_pokemonset'
  match 'pokemonsets/advanced_search' => 'pokemonsets#process_search' , as: 'process_search_pokemonset', via: [:get, :post]
  get 'pokemonsets/specie/:specie' => 'pokemonsets#specie' , as: 'specie_pokemonset'
  resources :pokemonsets do
  get :autocomplete_pokemon_name, :on => :collection
end
match '/contacts',     to: 'contacts#new',             via: 'get'
resources "contacts", only: [:new, :create]
  resources :pokemons

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'teams#stats'
#http://en.vgcsets.local:3000/teams/stats?utf8=%E2%9C%93&teams%5Bcountry%5D=&teams%5Brange%5D=0
   get 'pokemonsets/likes/:id' => 'pokemonsets#likes' , as: 'likes_pokemonset'
    get 'pokemonsets/dislikes/:id' => 'pokemonsets#dislikes' , as: 'dislikes_pokemonset'
  
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
get '/top/new' => 'teams#create_top'
get 'teams/index' => 'teams#index'
get '/teams' => 'teams#index'
get '/teams/show/:id' => 'teams#show', as: 'id'
get '/recursos/new/:id' => 'players#recursos_new', as: 'recursos'
get '/recursos/create' => 'players#recursos_create', as: 'recursos_create'
get '/vgc15' => 'pokemonsets#VGC15'
get '/vgc16'=> 'pokemonsets#VGC16'
get '/teams/filter' => 'teams#filter_pokemon'
get '/teams/new_single' => 'teams#new_single'
get '/teams/create_single' => 'teams#create_single' 
get '/teams/stats' => 'teams#stats'
get '/teams/edit/:id' => 'teams#edit'
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
    resources :teams
end
