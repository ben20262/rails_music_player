Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :artists
  resources :genres, only: [:new, :create, :show, :index]
  resources :playlists
  resources :sessions, only: [:new, :create]
  resources :songs
  resources :users, only: [:new, :create, :show]
end
