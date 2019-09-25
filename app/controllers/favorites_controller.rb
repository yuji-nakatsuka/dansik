class FavoritesController < ApplicationController

    before_action :authenticate_end_user!

  def destroy
    @movie=Movie.find(params[:id])
    @favorite=current_end_user.favorites.find_by(movie_id: @movie.id)
    @favorite.destroy
    redirect_to movie_path(@movie)
  end

  def index
    @favorites=current_end_user.favorites.all
  end

  def create
    @movie=Movie.find(params[:movie_id])
    @favorite=current_end_user.favorites.new(movie_id: @movie.id)
    @favorite.save
    redirect_to movie_path(@movie)
  end

end
