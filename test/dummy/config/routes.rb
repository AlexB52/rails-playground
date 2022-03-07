Rails.application.routes.draw do
  resources :articles
  mount Playground::Engine => "/playground"
end
