Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'pages#home'
  get 'about', to: 'pages#about'

  # this will give us all of the routes we need for articles
  # index, create, new, edit, show
  resources :articles, only: [:show, :index, :new, :create, :edit, :update, :destroy]

end
