Rails.application.routes.draw do
  resources :song_versions do
    get 'dates_for_song', on: :collection
  end
  get 'songs/random', to: 'song_versions#random', as: :random_song # Route for the random button (triggers the random action)
  get 'songs/:slug', to: 'song_versions#show', as: :song # Route for displaying individual songs (the show action)
  resources :users
  resources :categories
  get 'archives/index'
  resources :entries
  root to: "entries#index" # This sets up our root route and will go to the entries controller and find the index method and route to that
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
