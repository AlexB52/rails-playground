Rails.application.routes.draw do
  root 'articles#index'
  resources :comments
  resources :articles
  mount Playground::Engine => "/playground"
end
