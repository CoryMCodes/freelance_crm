Rails.application.routes.draw do
  get "tags/index"
  get "tags/create"
  get "tags/destroy"
  get "notes/create"
  get "notes/destroy"
  # Devise routes for authentication
  devise_for :users

  # Client management routes
  resources :clients do
    resources :notes, only: [ :create, :destroy ]
  end
  resources :tags, only: [ :index, :create, :destroy ]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "home#index"
end
