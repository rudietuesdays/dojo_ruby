Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/" => "users#new"
  post "/users/create" => "users#create"

  get "/users/:id" => "users#show"

  get "/sessions/new" => "sessions#new"
  post "/sessions/create" => "sessions#create"
  delete "/sessions/destroy" => "sessions#destroy"
  get '/secrets' => 'secrets#index'
  post '/secrets/create' => 'secrets#create'
  delete '/secrets/:id/destroy' => 'secrets#destroy'

  post '/likes/:id/liked' => 'likes#like'
  delete '/likes/:id/unlike' => 'likes#unlike'


end
