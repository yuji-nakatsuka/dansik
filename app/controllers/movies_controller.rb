class MoviesController < ApplicationController

  def index
  end

  def show
  end

  def new
    @movie=Movie.new
  end

  def create
    @movie=Movie.new(movie_params)
    @movie.save
    redirect_to movies_path
  end

  def edit
  end

  def destroy
  end

  def title_search
  end

  private
    def movie_params
      params.require(:movie).permit(:title, :url)
    end

end
