Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]

  resources :artists
  resources :genres, only: [:new, :create, :show, :index]
  resources :playlists
  resources :songs

  get '/users/:id/songs', to: 'users#songs', as: 'user_songs'
  
end
