Rails.application.routes.draw do
  resources :campaigns, only: [:show]
end
