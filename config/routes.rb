Rails.application.routes.draw do
  devise_for :users
  resources :callbacks, only: [:create]
  resources :campaigns, only: [:show] do
    resources :donations, only: [:new, :create]

    member do
      get "receipt"
    end
  end

  root to: "campaigns#index"
end
