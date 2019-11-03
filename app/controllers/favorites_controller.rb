class FavoritesController < ApplicationController

    before_action :authenticate_end_user!

  def destroy
    @movie=Movie.find(params[:id])
    @favorite=current_end_user.favorites.find_by(movie_id: @movie.id)
    @favorite.destroy
  end

  def index
    @favorites=current_end_user.favorites.page(params[:page]).reverse_order.per(10)
  end

  def create
    @movie=Movie.find(params[:movie_id])
    @favorite=current_end_user.favorites.new(movie_id: @movie.id)
    @favorite.save
  end

end
