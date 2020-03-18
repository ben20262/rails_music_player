Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, only: [:new, :create, :show]

  resources :artists, only: [:new, :create, :update, :show, :index, :destroy]
  resources :genres, only: [:new, :create, :show, :index, :destroy]
  resources :playlists, only: [:new, :create, :index, :show, :update, :destroy]
  resources :songs

  root to: 'users#show'

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy', as: 'logout'
  get '/signup', to: 'users#new', as: 'signup'

  get '/users/:id/songs', to: 'users#songs', as: 'user_songs'
  post '/users/songs/:id', to: 'users#add_song', as: 'add_user_song'

  get '/songs/:id/playlist', to: 'songs#add_song_playlist', as: 'add_playlist_song'
  patch '/playlists/:id/songs/:song_id', to: 'playlists#update', as: 'update_playlist'

end
