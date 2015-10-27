Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

root 'sessions#new'


resources :doctors

  get 'doctors' => 'doctors#index'
  get 'doctors' => 'doctors#new'
  get '/doctors/:id/edit' => 'doctors#edit'
  put  '/doctors/:id/' => 'doctors#update'
  put   '/doctors/:id/edit'   => 'doctors#update' 


resources :patients

  get 'patients' => 'patients#index'
  get 'patients' => 'patients#new'
  get 'patients/:id' => 'patients#show'
  get '/patients/:id/edit' => 'patients#edit'
  put '/patients/:id/' => 'patients#update'
  put '/patients/:id/edit'   => 'patients#update' 

resources :appointments

  get 'appointments' => 'appointments#index'
  get 'appointments' => 'appointments#new'
  delete 'appointments' => 'appointments#destroy'

  resources :sessions

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'



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
