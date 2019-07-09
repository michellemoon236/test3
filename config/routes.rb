Rails.application.routes.draw do
  resources :users
  
  resources :projects do 
    resources :tasks
  end

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

  root 'users#home'
end
