Rails.application.routes.draw do
  devise_for :admins, :controllers => {
    :passwords => 'admins/passwords',
    :sessions => 'admins/sessions'
  }

  devise_for :end_users, :controllers => {
    :registrations => 'end_users/registrations',
    :passwords => 'end_users/passwords',
    :sessions => 'end_users/sessions'
  }

  root 'end_users/tops#top'

  get 'movies/search' => 'movies#title_search', as: 'title_search'
  get 'end_users/:end_user_id/movies' => 'end_users#index', as: 'my_post'
  get 'movies/:tag/tag_search' => 'tags#tag_search', as: 'tag_search'

  resources :movies, only: [:index, :show] do
    resources :comments, only: [:create,:destroy]
    resources :favorites, only: [:destroy,:create]
  end



  resources :end_users, only: [:show, :edit, :destroy, :update] do
    resources :favorites, only: [:index]
    resources :movies, only: [:new, :create, :edit,:update,:destroy]
  end



  namespace :admins do
    get '/' => 'tops#top', as: 'top'
    get 'movies/search' => 'movies#title_search', as: 'title_search'
    get 'movies/tag_search' => 'movies#tag_search', as: 'tag_search'
    resources :end_users, only: [:index, :show,:destroy]
    resources :movies, only: [:index, :show,:edit,:update,:destroy]
    resources :tags, only: [:index, :destroy]
    resources :comments, only: [:index,:create, :destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
