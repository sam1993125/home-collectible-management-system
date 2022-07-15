Rails.application.routes.draw do
  # Routing logic: fallback requests for React Router.
  # Leave this here to help deploy your app later!
  resources :item_statuses
  resources :users  
  resources :items
  
  
  
  # Users Controller
  post "/signup", to: "users#create"
  get "/me", to: "users#show"
  get "/users", to: "users#index"

   # Sessions Controller
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy" 
  
   # Items Controller
  post "/users/:user_id/items", to: "items#create"
  get "/users/:user_id/items", to: "users#items_index"
  delete "/items/:id", to: "items#destroy"
  get  "/items/:item_id", to: "items#show"
  patch "/items/:item_id", to: "items#update"

  #Item Statuses Controller
  get "/item_status/:id", to: "item_statuses#show"
  post"/item_status/:id", to:"item_statuses#create"

end
