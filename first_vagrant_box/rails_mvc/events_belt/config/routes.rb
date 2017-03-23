Rails.application.routes.draw do

  root to: 'sessions#new'

  post '/sessions/create'

  post '/users/create'
  get '/users/:id/edit' => 'users#edit'
  patch '/users/:id' => 'users#update'

  get '/events' => 'events#index'
  post '/events/create'
  get '/events/:id' => 'events#show'
  get '/events/:id/edit' => 'events#edit'
  patch '/events/:id' => 'events#update'

  post '/attendances/:id' => 'attendances#create'
  delete '/attendances/:id' => 'attendances#destroy'

  post '/comments/:id' => 'comments#create' 

  delete '/logout/:id' => 'sessions#destroy'
  delete '/events/:id' => 'events#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
