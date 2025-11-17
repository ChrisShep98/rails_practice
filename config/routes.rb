Rails.application.routes.draw do
  resources :categories
  get 'archives/index'
  resources :entries
  root to: "entries#index" # This sets up our root route and will go to the entries controller and find the index method and route to that
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
