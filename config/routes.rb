Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'recipes#index'

  get '/recipes/search', to: "recipes#search"
  get '/recipes/:id', to: "recipes#show"
end
