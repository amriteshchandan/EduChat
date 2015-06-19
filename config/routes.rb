Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount Ckeditor::Engine => '/ckeditor'

  resources :articles do
    resources :comments
  end

  get 'article/:title', to: 'articles#show', as: 'user_article'
  get 'articles/:title/edit', to: 'articles#edit', as: 'edit_user_article'
  patch 'articles/:title', to: 'articles#update', as: 'update_article'
  delete 'articles/:title', to: 'articles#destroy', as: 'destroy_article'

  resources :user_technologies
  
  get 'interests/', to: 'user_technologies#new', as: 'interests'
  
  post 'user_technologies/create'

  get 'technologies/:name', to: 'technologies#show',as: 'technology_name'

  resources :technologies


  get 'profile/',to: 'profile#show', as: 'profile'

# users controller
  get 'user/index'
  get 'user/:username', to: 'user#show', as: 'user_profile'
#
  root 'home#index'

  devise_for :users, controllers: {registrations: "registrations"}

    # mailbox folder routes
  get "mailbox/inbox" => "mailbox#inbox", as: :mailbox_inbox
  get "mailbox/sent" => "mailbox#sent", as: :mailbox_sent
  get "mailbox/trash" => "mailbox#trash", as: :mailbox_trash

    # conversations
  resources :conversations do
    member do
      post :reply
      post :trash
      post :untrash
    end
  end


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
