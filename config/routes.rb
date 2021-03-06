Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'pages#home'
  get 'about', to: 'pages#about'

  # this will give us all of the routes we need for articles
  # index, create, new, edit, show
  # resources :articles, only: [:show, :index, :new, :create, :edit, :update, :destroy]

  resources :articles do
    member do
      get 'preview'
    end
  end

  get 'signup', to: 'users#new'
  resources :users, except: [:new]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :categories, except: [:destroy]

end
