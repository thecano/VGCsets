Rails.application.routes.draw do
  get 'contact_form/new'

  get 'contact_form/create'

  get 'pokemonsets/best' => 'pokemonsets#best' , as: 'best_pokemonset'
  get 'pokemonsets/search' => 'pokemonsets#search' , as: 'search_pokemonset'
  get 'pokemonsets/process_search' => 'pokemonsets#process_search' , as: 'process_search_pokemonset'
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
   root 'pokemonsets#index'

   get 'pokemonsets/likes/:id' => 'pokemonsets#likes' , as: 'likes_pokemonset'
    get 'pokemonsets/dislikes/:id' => 'pokemonsets#dislikes' , as: 'dislikes_pokemonset'
  
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
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
