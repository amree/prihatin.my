Rails.application.routes.draw do
  get "home/index"

  resources :callbacks, only: [:create]
  resources :campaigns, only: [:show] do
    resources :donations, only: [:new, :create]

    member do
      get "receipt"
    end
  end

  devise_for(
    :users,
    controllers: { omniauth_callbacks: "omniauth_callbacks" }
  )

  root to: "home#index"
end
