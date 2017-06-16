Rails.application.routes.draw do
  resources :campaigns, only: [:show] do
    resources :donations, only: [:new, :create]

    member do
      get "receipt"
    end
  end
end
