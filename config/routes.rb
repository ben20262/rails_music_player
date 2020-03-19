Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'users#show'
  resources :users, only: [:new, :create]
  resources :users, only: [:show] do
    resources :songs, only: [:index, :show, :update]
  end

  resources :artists, only: [:new, :create, :update, :index, :destroy]
  resources :artists, only: [:show] do
    resources :songs, only: [:new, :index, :show]
  end

  get '/songs/genres', to: 'songs#song_genre', as: 'song_genre'
  resources :songs, only: [:new, :create, :show, :index, :destroy]

  resources :playlists, only: [:new, :create, :index, :update, :destroy]
  get '/songs/:id/playlist', to: 'songs#add_song_playlist', as: 'add_playlist_song'
  patch '/playlists/:id/songs/:song_id', to: 'playlists#update', as: 'update_playlist'
  resources :playlists, only: [:show] do
    resources :songs, only: [:index, :show]
  end

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy', as: 'logout'
  get '/signup', to: 'users#new', as: 'signup'
  get '/auth/facebook/callback' => 'sessions#face_create'

end