Rails.application.routes.draw do
  #Static Pages
  get '/about-us', to:'pages#about'
  get '/contact-us', to:'pages#contact'

  #Users
  #root 'users#index'
  get '/signup', to: 'users#new'

  #Sessions
  root 'sessions#new'
  delete 'logout', to: 'sessions#destory'
  get 'sessions/create'

  resources :users
  resources :sessions, only: :create
  #Relationship
  resources :relationships, only: [:create, :destory]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
