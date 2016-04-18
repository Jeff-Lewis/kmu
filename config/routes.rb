Rails.application.routes.draw do

  resources :searches
  root 'home#index'

  devise_for :users, :controllers => {registrations: 'registrations'}

  get 'home/index'
  post 'home/index'
  
  get 'home/dashboard'
  post 'home/dashboard'
  
  mount Dashing::Engine, at: Dashing.config.engine_path

  get 'rights/index'
  post 'rights/index'
  post 'rights/:id' , to: 'rights#destroy'

  # get 'right/user'
  # post 'right/user'
  
  get 'accesses/index'
  post 'accesses/index'
  post 'accesses/:id' , to: 'accesses#destroy'

  get 'stats/ressource'
  post 'stats/ressource'

  get 'stats/workorder'
  post 'stats/workorder'

  get 'users/index' 
  get 'users/workorder'

  get 'workorders/index'
  post 'workorders/index'

  get 'timetracks/report'
  post 'timetracks/report'

  get  'plannings/overview', to: 'plannings#overview'
  post 'plannings/overview', to: 'plannings#overview'
  
  get 'companies/search'
  
  resources :companies
  resources :users
  resources :workorders
  resources :timetracks
  resources :plannings
  resources :accesses
  resources :rights
  resources :searches
  resources :services

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
