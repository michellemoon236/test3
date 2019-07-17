Rails.application.routes.draw do
  resources :users
  
  resources :projects do 
    resources :tasks
  end

  resources :tasks

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

  get 'tasks/:id/complete', to: "tasks#task_complete", as: 'task_complete'

  root 'users#home'
end
