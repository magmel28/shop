Rails.application.routes.draw do

  get 'line_items/create'

  get 'carts/show'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  namespace :backend do
    resources :categories
  end

  resources :products, only: [:index, :show]

  resources :line_items
  get 'cart' => 'carts#show'

  root 'pages#home'
  get 'about' => 'pages#about', as: :about
  get 'contact' => 'pages#contact', as: :contact

  # namespace :backend do
  # get 'categories/index'
  # end
  #
  # namespace :backend do
  # get 'categories/new'
  # end
  #
  # namespace :backend do
  # get 'categories/create'
  # end
  #
  # namespace :backend do
  # get 'categories/update'
  # end
  #
  # namespace :backend do
  # get 'categories/show'
  # end


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
