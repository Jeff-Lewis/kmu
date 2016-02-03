Rails.application.routes.draw do


  root 'user_login#login'

  get 'home/index'
  
  get 'user_login/signin'
  post 'user_login/signin', to: 'user_login#verify_signin'
  get 'user_login/login'
  post 'user_login/login', to: 'user_login#verify_login'
  get 'user_login/logout'
  get 'users/index' 
  get 'users/choose_a_user', to: 'users#choose'
  post 'users/choose_a_user', to: 'users#choose'

  get 'workorders/index'
  get 'workorders/show_user_workorders', to: 'workorders#show_user_workorders'
  get 'workorders/report', to: 'workorders#report'

  
  resources :timetracks
  resources :accesses
  resources :workorders
  resources :users

# user soutes
#  post 'users/login', to: 'users#verify_login'
#  get 'users/choose_a_user', to: 'users#choose'
#  post 'users/choose_a_user', to: 'users#choose'
#  post 'users/login', to: 'users#verify_login'

#workorder routes  
#  get 'workorders/report_workorders', to: 'workorders#report_workorders'



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
