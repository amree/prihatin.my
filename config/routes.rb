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

  constraints(CampaignUrlConstrainer.new) do
    get "/:id", to: "campaigns#show", as: "campaign_slug_path"
  end

  root to: "home#index"
end
