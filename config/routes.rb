Rails.application.routes.draw do
  # Static Pages
  root 'pages#dashboard'
  get '/about-us', to:'pages#about'
  get '/contact-us', to:'pages#contact'

  # Users
  get '/signup', to: 'users#new'
  # Sessions
  get '/login', to: 'sessions#new', as: 'login'
  delete '/logout', to: 'sessions#destory', as: 'logout'

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
