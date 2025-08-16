Rails.application.routes.draw do
  
  
  get "applications/create"
  get "applications/index"
  
  get "home/index"
  get "posts/index"
  get "posts/new"
  get "posts/create"
  get "clients/new"
  get "clients/create"
  get "organizations/new"
  get "organizations/create"
  get "registrations/new"
  get "registrations/create"
  get "sessions/new"
  get "sessions/create"
  get "sessions/destroy"
  root 'home#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy', as: :logout
  
  get 'signup', to: 'registrations#new'
  post 'signup', to: 'registrations#create'
  get 'applications', to: 'applications#index', as: :applications
  
  resources :posts, only: [:index, :new, :create] do
    resources :applications, only: [:create]
  end
  
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  

  # Defines the root path route ("/")
  # root "posts#index"
end

