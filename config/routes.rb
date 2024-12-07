require 'sidekiq/web'

Rails.application.routes.draw do
  resources :publishers
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "articles/index/:lang" => "articles#index"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "articles#index"
  # or require 'sidekiq/pro/web'
  # or require 'sidekiq-ent/web'

  mount Sidekiq::Web => "/sidekiq" # mount Sidekiq::Web in your Rails app
end

