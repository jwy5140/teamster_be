Rails.application.routes.draw do
  
  resources :sessions, only: [:create, :destroy]
  resources :users
  resources :goals
  resources :ignores, only: [:create]
  resources :blocks, only: [:create, :destroy]

  post 'signup', to: 'users#create', as: 'signup'
  post 'login', to: 'sessions#create', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'ignores/:id/destroy_all', to: 'ignores#destroy_all'

  get 'session', to: 'sessions#auth_check'
  get 'session_end', to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
