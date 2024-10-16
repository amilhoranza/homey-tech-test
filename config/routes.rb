Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :projects, only: [:index, :show, :create]
      post 'auth/login', to: 'authentication#login'
    end
  end

  devise_for :users
  # get '/users/sign_out', to: 'devise/sessions#destroy'
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :projects do
    resources :comments, only: [:create]
    resource :statuses, only: [:update]
  end

  root to: "projects#index"
end
