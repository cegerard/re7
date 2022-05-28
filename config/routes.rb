Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  root 'recipes#index'
  
  resources :ingredients, except: [:destroy]
  post '/ingredients/:id/archive', to: "ingredients#archive"
  post '/ingredients/:id/unarchive', to: "ingredients#unarchive"
  
  get '/recipes/search', to: "recipes#search"
  get '/recipes/:id', to: "recipes#show"
  post '/recipes/:id/archive', to: "recipes#archive"

  
end
