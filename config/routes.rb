Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

resources :regions, param: :slug
# Landmarks routes
resources :landmarks, param: :slug do
  # Voting actions for landmarks
  member do
    put 'like', to: 'landmarks#like'
    put 'unlike', to: 'landmarks#unlike'
  end

  # Nesting comments under landmarks
  resources :comments, only: [:create, :edit, :update, :destroy] do
    member do
      put 'like', to: 'comments#like'
      put 'unlike', to: 'comments#unlike'
    end
  end
  resources :saves, only: [ :create, :destroy ]
end


  
  



  get "pages/nearby"
  get "pages/my_landmarks", to: "pages#my_landmarks", as: "my_landmarks"


  get "pages/about"
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "search", to: "pages#search"
  root "regions#index"
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
