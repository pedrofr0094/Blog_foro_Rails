Rails.application.routes.draw do
  root 'page#index'
  get 'about', to: 'page#about'
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :users, except: [:new]
  resources :articles
  resources :polls
  resources :posts
end
