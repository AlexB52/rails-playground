Playground::Engine.routes.draw do
  root 'consoles#show'
  resources :scripts, only: [:index, :new] do
    get :script, on: :collection, to: "scripts#show"
  end
end
