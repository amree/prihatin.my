Rails.application.routes.draw do
  resources :callbacks, only: [:create]
  resources :campaigns, only: [:show] do
    resources :donations, only: [:new, :create]

    member do
      get "receipt"
    end
  end
end
