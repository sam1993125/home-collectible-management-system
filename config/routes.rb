Rails.application.routes.draw do
  # Routing logic: fallback requests for React Router.
  # Leave this here to help deploy your app later!
  resources :item_statuses
  resources :item_details
  resources :users

  # get "/me", to: "users#show"
  post "/login", to: "sessions#create"
  post "/signup", to: "users#create"
  delete "/logout", to: "sessions#destroy" 
  

  get "*path", to: "fallback#index", constraints: ->(req) { !req.xhr? && req.format.html? }
end
