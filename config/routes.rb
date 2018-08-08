Rails.application.routes.draw do
  get 'users/new'
  get 'welcome/index'

  resources :users

  root 'users#new'
end
