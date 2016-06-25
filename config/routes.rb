Rails.application.routes.draw do

  get 'ticketuserview/index'
  get 'users/ticketstatus'

  resources :user_tickets
  resources :tickets
  resources :customers
  get 'showcal/action'

  get 'showcal/bid'

  get 'showcal/event'

  resources :bid_documents
  resources :hs_ratings
  resources :hotspot_details
  resources :hotspots
  resources :favourits
  get 'ticker/index'

  resources :appparams
  get 'offer/index2'
  get 'offer/index'
  get 'home/index3'
  
  resources :webmasters
  resources :bid_details
  resources :bids
  resources :jobs
  resources :donation_stats
  resources :donation_details
  resources :donations
  resources :sponsors
  resources :event_details
  resources :events
  devise_for :users, :controllers => {registrations: 'registrations'}

  resources :companies
  resources :users
  resources :searches
  resources :services
  resources :calenders
  resources :vehicles
  resources :request_details
  resources :requests
  resources :ratings
  resources :searches

  root 'home#index'
  get 'admin/sendmail'
  get 'admin/showmap'
  get 'home/index'
  post 'home/index'
  get 'home/dashboard'
  post 'home/dashboard'
  get 'users/index' 
  get 'users/workorder'
  get 'companies/search'
  
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
