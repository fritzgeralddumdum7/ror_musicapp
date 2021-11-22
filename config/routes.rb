Rails.application.routes.draw do
  resources :artists
  # get 'albums/artist/:id' => 'albums#index', :as => :artist_albums
  # get 'albums/artist/:id/new' => 'albums#new', :as => :album_artist_new

  resources :albums
  resources :tracks

  root to: 'artists#index'
end
