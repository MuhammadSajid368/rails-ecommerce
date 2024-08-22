Rails.application.routes.draw do
  # Devise routes for user authentication with custom controllers
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  # Stripe payment routes
  post '/webhooks/stripe', to: 'webhooks#stripe'
  get 'payment', to: 'payments#new'
  post 'payment', to: 'payments#create'
  get 'payment/success', to: 'payments#success'
  get 'payment/cancel', to: 'payments#cancel'

  # Default root route to the homepage
  root 'home#index'

  # Other resources
  # resources :users, only: [:show, :edit, :update]
  resources :account_activations, only: [:edit]
  resources :microposts, only: %i[create destroy]
  resources :orders
  resources :relationships, only: [:create, :destroy]

  # Products with nested comments and ratings routes
  resources :products do
    resources :comments, only: [:create, :destroy]
    resources :ratings, only: [:create]
  end

  # # Shopping cart routes
  # get 'carts/:id' => 'carts#show', as: 'cart'
  # delete 'carts/:id' => 'carts#destroy'
  
  # Line item routes
  post 'line_items/:id/add' => 'line_items#add_quantity', as: 'line_item_add'
  post 'line_items/:id/reduce' => 'line_items#reduce_quantity', as: 'line_item_reduce'
  post 'line_items' => 'line_items#create'
  get 'line_items/:id' => 'line_items#show', as: 'line_item'
  delete 'line_items/:id' => 'line_items#destroy'
end
