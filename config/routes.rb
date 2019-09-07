Rails.application.routes.draw do
  devise_for :admins, :controllers => {
    :registrations => 'admins/registrations',
    :passwords => 'admins/passwords',
    :sessions => 'admins/sessions'
  }

  devise_for :end_users, :controllers => {
    :registrations => 'end_users/registrations',
    :passwords => 'end_users/passwords',
    :sessions => 'end_users/sessions'
  }


  root 'end_users/tops#top'
  resources :movies, only: [:index, :show]
  get 'movies/search' => 'movies#title_search', as: 'title_search'
  get 'movies/movie_id/tags/tag_search' => 'movies#tag_search', as: 'tag_search'

  resources :end_users, only: [:show, :edit, :destroy] do
    resources :comments, only: [:create,:destroy]
    resources :favorites, only: [:create, :index, :destroy]
    resources :movies, only: [:new, :create, :edit, :destroy] do
        resources :favorites, only: [:destroy, :index, :create]
    end
  end



  namespace :admins do
    get '/' => 'tops#top', as: 'top'
    get 'movies/search' => 'movies#title_search', as: 'title_search'
    get 'movies/movie_id/tags/tag_search' => 'movies#tag_search', as: 'tag_search'
    resources :end_users, only: [:index, :show,:destroy]
    resources :movies, only: [:index, :show,:destroy]
    resources :tags, only: [:index, :destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
