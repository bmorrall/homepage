Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", :as => :rails_health_check

  devise_for :users, controllers: {omniauth_callbacks: "users/omniauth_callbacks"}

  resources :users, only: [:show] do
    collection do
      get "me"
    end
  end

  get "cache_for" => "welcome#cache_for"
  get "cache_since" => "welcome#cache_since"
  get "cache_private" => "welcome#cache_private"

  # Defines the root path route ("/")
  # root "posts#index"
end
