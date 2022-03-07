Rails.application.routes.draw do
  resources :comments
  resources :articles
  mount Playground::Engine => "/playground"
end
