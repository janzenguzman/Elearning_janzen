Rails.application.routes.draw do
  # Static Pages
  get '/about-us', to:'pages#about'
  get '/contact-us', to:'pages#contact'

  # Users
  # root 'users#index'
  get '/signup', to: 'users#new'
  get '/dashboard', to: 'users#dashboard'
  get '/admin/dashboard', to: 'admin/users#dashboard'

  # Sessions
  root 'sessions#new'
  delete 'logout', to: 'sessions#destory'
  get 'sessions/create'

  # Sessions
  resources :sessions, only: :create
  # Relationship
  resources :relationships, only: [:create, :destroy] do
    resources :activities, module: :relationships
  end
  # Admin
  namespace :admin do
    # Category
    resources :categories do
      # Words
      resources :words
    end
  end
  #Categories
  resources :categories, only: [:index] do
    #Lessons
    resources :lessons, only: [:new, :create, :show] do
      #Answers
      resources :answers, only: [:new, :create]
      resources :activities, module: :lessons
    end
  end

  #Users
  resources :users do
    member do
      get :following, :followers
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
